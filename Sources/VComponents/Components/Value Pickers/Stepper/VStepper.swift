//
//  VStepper.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 2/2/21.
//

import SwiftUI
import VCore

// MARK: - V Stepper
/// Value picker component that selects value from a bounded linear range of values.
///
/// UI Model, step, and state can be passed as parameters.
///
///     @State private var value: Double = 0.5
///
///     var body: some View {
///         VStepper(
///             range: 1...10,
///             value: $value
///         )
///         .padding()
///     }
///
@available(macOS, unavailable) // Doesn't follow Human Interface Guidelines
@available(tvOS, unavailable) // Doesn't follow Human Interface Guidelines. No `SwiftUIGestureBaseButton` support.
@available(watchOS, unavailable) // Doesn't follow Human Interface Guidelines. No `SwiftUIGestureBaseButton` support.
public struct VStepper: View {
    // MARK: Properties
    private let uiModel: VStepperUIModel
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    private var internalState: VStepperInternalState { .init(isEnabled: isEnabled) }
    @State private var pressedButton: VStepperButton?
    private func buttonInternalState(_ button: VStepperButton) -> VStepperButtonInternalState {
        .init(
            isEnabled: buttonIsEnabled(button),
            isPressed: pressedButton == button
        )
    }
    
    private let range: ClosedRange<Int>
    private let step: Int
    
    @Binding private var value: Int
    
    @State private var longPressSchedulerTimer: Timer?
    @State private var longPressIncrementTimer: Timer?
    @State private var longPressIncrementTimerIncremental: Timer?
    @State private var longPressIncrementTimeElapsed: TimeInterval = 0
    @State private var shouldSkipIncrementBecauseOfLongPressIncrementFinish: Bool = false
    
    // MARK: Initializers
    /// Initializes `VStepper` with range and value.
    public init(
        uiModel: VStepperUIModel = .init(),
        range: ClosedRange<Int>,
        step: Int = 1,
        value: Binding<Int>
    ) {
        self.uiModel = uiModel
        self.range = range
        self.step = step
        self._value = value
    }
    
    // MARK: Body
    public var body: some View {
        ZStack(content: {
            background
            buttons
        })
        .frame(size: uiModel.layout.size)
        .cornerRadius(uiModel.layout.cornerRadius)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: uiModel.layout.cornerRadius)
            .foregroundColor(uiModel.colors.background.value(for: internalState))
    }
    
    private var buttons: some View {
        HStack(spacing: 0, content: {
            button(.minus)
            divider
            button(.plus)
        })
        .frame(maxWidth: .infinity)
    }
    
    private func button(_ button: VStepperButton) -> some View {
        SwiftUIGestureBaseButton(
            onStateChange: { stateChangeHandler(button: button, gestureState: $0) },
            label: {
                ZStack(content: {
                    RoundedRectangle(cornerRadius: uiModel.layout.cornerRadius)
                        .foregroundColor(uiModel.colors.buttonBackground.value(for: buttonInternalState(button)))

                    button.icon
                        .resizable()
                        .scaledToFit()
                        .frame(dimension: uiModel.layout.iconDimension)
                        .foregroundColor(uiModel.colors.buttonIcon.value(for: buttonInternalState(button)))
                })
                .frame(maxWidth: .infinity)
            }
        )
        .disabled(!buttonIsEnabled(button))
    }
    
    private var divider: some View {
        Rectangle()
            .frame(size: uiModel.layout.divider)
            .foregroundColor(uiModel.colors.divider.value(for: internalState))
    }
    
    // MARK: Actions
    private func stateChangeHandler(
        button: VStepperButton,
        gestureState: GestureBaseButtonGestureState
    ) {
        DispatchQueue.main.async(execute: {
            if !gestureState.isPressed {
                pressedButton = nil
                shouldSkipIncrementBecauseOfLongPressIncrementFinish = longPressIncrementTimer != nil
                zeroLongPressTimers()
                
            } else if pressedButton != button {
                pressedButton = button
                scheduleLongPressIncrementSchedulerTimer(for: button)
            }
            
            if gestureState.isClicked {
                playHapticPressEffect()
                action(button: button)
            }
        })
    }
    
    private func action(button: VStepperButton) {
        guard !shouldSkipIncrementBecauseOfLongPressIncrementFinish else {
            shouldSkipIncrementBecauseOfLongPressIncrementFinish = false
            return
        }
        
        switch button {
        case .minus:
            if value <= range.lowerBound {
                zeroLongPressTimers()
            } else {
                value -= step
            }
            
        case .plus:
            if value >= range.upperBound {
                zeroLongPressTimers()
            } else {
                value += step
            }
        }
    }
    
    // MARK: Long Press Increment
    private func scheduleLongPressIncrementSchedulerTimer(for button: VStepperButton) {
        zeroLongPressTimers()
        
        longPressSchedulerTimer = .scheduledTimer(withTimeInterval: uiModel.misc.intervalToStartLongPressIncrement, repeats: false, block: { _ in
            if longPressIncrementTimeElapsed == 0 { playHapticLongPressEffect() }
            scheduleLongPressIncrementTimer()
        })
    }
    
    private func scheduleLongPressIncrementTimer() {
        zeroLongPressTimers()
        
        longPressIncrementTimer = .scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            longPressIncrementTimeElapsed += timer.timeInterval
            incrementFromLongPress()
        })
        
        longPressIncrementTimeElapsed = 1
        longPressIncrementTimer?.fire()
    }
    
    private func incrementFromLongPress() {
        longPressIncrementTimerIncremental?.invalidate()
        longPressIncrementTimerIncremental = nil
        
        let interval: TimeInterval = {
            let adjustedStep: Int = .init(pow(Double(uiModel.misc.longPressIncrementExponent), longPressIncrementTimeElapsed)) * step
            let interval: TimeInterval = 1 / Double(adjustedStep)
            return interval
        }()
        
        longPressIncrementTimerIncremental = .scheduledTimer(withTimeInterval: interval, repeats: true, block: { timer in
            if let pressedButton {
                action(button: pressedButton)
            } else {
                zeroLongPressTimers()
            }
        })
        
        longPressIncrementTimerIncremental?.fire()
    }
    
    private func zeroLongPressTimers() {
        longPressSchedulerTimer?.invalidate()
        longPressSchedulerTimer = nil
        
        longPressIncrementTimer?.invalidate()
        longPressIncrementTimer = nil
        
        longPressIncrementTimerIncremental?.invalidate()
        longPressIncrementTimerIncremental = nil
        
        longPressIncrementTimeElapsed = 0
    }
    
    // MARK: Haptics
    private func playHapticPressEffect() {
#if os(iOS)
        HapticManager.shared.playImpact(uiModel.animations.hapticPress)
#endif
    }
    
    private func playHapticLongPressEffect() {
#if os(iOS)
        HapticManager.shared.playImpact(uiModel.animations.hapticLongPress)
#endif
    }
    
    // MARK: Helpers
    private func buttonIsEnabled(_ button: VStepperButton) -> Bool {
        switch (internalState, button) {
        case (.disabled, _): return false
        case (.enabled, .minus): return !(value <= range.lowerBound)
        case (.enabled, .plus): return !(value >= range.upperBound)
        }
    }
}

// MARK: - Preview
// Developmental only
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
struct VStepper_Previews: PreviewProvider {
    // Configuration
    private static var languageDirection: LayoutDirection { .leftToRight }
    private static var dynamicTypeSize: DynamicTypeSize? { nil }
    private static var colorScheme: ColorScheme { .light }
    
    // Previews
    static var previews: some View {
        Group(content: {
            Preview().previewDisplayName("*")
            StatesPreview().previewDisplayName("States")
        })
        .environment(\.layoutDirection, languageDirection)
        .applyIfLet(dynamicTypeSize, transform: { $0.dynamicTypeSize($1) })
        .colorScheme(colorScheme)
    }
    
    // Data
    private static var range: ClosedRange<Int> { 1...10 }
    private static var value: Int { 5 }
    
    // Previews (Scenes)
    private struct Preview: View {
        @State private var value: Int = VStepper_Previews.value
        
        var body: some View {
            PreviewContainer(content: {
                VStack(content: {
                    VStepper(
                        range: range,
                        value: $value
                    )
                    
                    Text(String(value))
                })
            })
        }
    }
    
    private struct StatesPreview: View {
        var body: some View {
            PreviewContainer(content: {
                PreviewRow(
                    axis: .horizontal,
                    title: "Enabled",
                    content: {
                        VStepper(
                            range: range,
                            value: .constant(value)
                        )
                    }
                )
                
                // Color is also applied to other rows.
                PreviewRow(
                    axis: .horizontal,
                    title: "Pressed (Row)",
                    content: {
                        VStepper(
                            uiModel: {
                                var uiModel: VStepperUIModel = .init()
                                uiModel.colors.buttonBackground.enabled = uiModel.colors.buttonBackground.pressed
                                uiModel.colors.buttonIcon.enabled = uiModel.colors.buttonIcon.pressed
                                return uiModel
                            }(),
                            range: range,
                            value: .constant(value)
                        )
                    }
                )
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Disabled",
                    content: {
                        VStepper(
                            range: range,
                            value: .constant(value)
                        )
                        .disabled(true)
                    }
                )
                
                PreviewSectionHeader("Native")
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Enabled",
                    content: {
                        Stepper("", value: .constant(value), in: range)
                            .labelsHidden()
                    }
                )
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Disabled",
                    content: {
                        Stepper("", value: .constant(value), in: range)
                            .labelsHidden()
                            .disabled(true)
                    }
                )
            })
        }
    }
}
