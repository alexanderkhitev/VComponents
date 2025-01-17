//
//  VRadioButton.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 1/19/21.
//

import SwiftUI
import VCore

// MARK: - V Radio Button
/// State picker component that toggles between off, on, or disabled states, and displays label.
///
/// Component can be initialized without label, with title, or label.
///
/// UI Model can be passed as parameter.
///
/// `Bool` can also be passed as state.
///
///     @State private var state: VRadioButtonState = .on
///
///     var body: some View {
///         VRadioButton(
///             state: $state,
///             title: "Lorem Ipsum"
///         )
///     }
///
/// Component can be also initialized with `Bool`:
///
///     @State private var isOn: Bool = true
///
///     var body: some View {
///         VRadioButton(
///             state: Binding(isOn: $isOn),
///             title: "Lorem Ipsum"
///         )
///     }
///
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct VRadioButton<Label>: View where Label: View {
    // MARK: Properties
    private let uiModel: VRadioButtonUIModel
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    @State private var isPressed: Bool = false
    @Binding private var state: VRadioButtonState
    private var internalState: VRadioButtonInternalState { .init(isEnabled: isEnabled, isOn: state == .on, isPressed: isPressed) }
    
    private let label: VRadioButtonLabel<Label>
    
    // MARK: Initializers
    /// Initializes `VRadioButton` with state.
    public init(
        uiModel: VRadioButtonUIModel = .init(),
        state: Binding<VRadioButtonState>
    )
        where Label == Never
    {
        self.uiModel = uiModel
        self._state = state
        self.label = .empty
    }
    
    /// Initializes `VRadioButton` with state and title.
    public init(
        uiModel: VRadioButtonUIModel = .init(),
        state: Binding<VRadioButtonState>,
        title: String
    )
        where Label == Never
    {
        self.uiModel = uiModel
        self._state = state
        self.label = .title(title: title)
    }
    
    /// Initializes `VRadioButton` with state and label.
    public init(
        uiModel: VRadioButtonUIModel = .init(),
        state: Binding<VRadioButtonState>,
        @ViewBuilder label: @escaping (VRadioButtonInternalState) -> Label
    ) {
        self.uiModel = uiModel
        self._state = state
        self.label = .label(label: label)
    }
    
    // MARK: Body
    public var body: some View {
        Group(content: {
            switch label {
            case .empty:
                radioButton
                
            case .title(let title):
                HStack(spacing: 0, content: {
                    radioButton
                    
                    spacer
                    
                    SwiftUIGestureBaseButton(
                        onStateChange: stateChangeHandler,
                        label: {
                            Text(title)
                                .multilineTextAlignment(uiModel.layout.titleTextLineType.textAlignment ?? .leading)
                                .lineLimit(type: uiModel.layout.titleTextLineType.textLineLimitType)
                                .minimumScaleFactor(uiModel.layout.titleTextMinimumScaleFactor)
                                .foregroundColor(uiModel.colors.titleText.value(for: internalState))
                                .font(uiModel.fonts.titleText)
                        }
                    )
                    .disabled(!uiModel.misc.labelIsClickable) // `disabled(:_)` because it's a `SwiftUIGestureBaseButton`
                })
                
            case .label(let label):
                HStack(spacing: 0, content: {
                    radioButton
                    
                    spacer
                    
                    SwiftUIGestureBaseButton(
                        onStateChange: stateChangeHandler,
                        label: {
                            label(internalState)
                        }
                    )
                    .disabled(!uiModel.misc.labelIsClickable) // `disabled(:_)` because it's a `SwiftUIGestureBaseButton`
                })
            }
        })
        .applyIf(uiModel.animations.appliesStateChangeAnimation, transform: {
            $0.animation(uiModel.animations.stateChange, value: internalState)
        })
    }
    
    private var radioButton: some View {
        SwiftUIGestureBaseButton(
            onStateChange: stateChangeHandler,
            label: {
                ZStack(content: {
                    Circle()
                        .frame(dimension: uiModel.layout.dimension)
                        .foregroundColor(uiModel.colors.fill.value(for: internalState))
                    
                    Circle()
                        .strokeBorder(uiModel.colors.border.value(for: internalState), lineWidth: uiModel.layout.borderWidth)
                        .frame(dimension: uiModel.layout.dimension)
                    
                    Circle()
                        .frame(dimension: uiModel.layout.bulletDimension)
                        .foregroundColor(uiModel.colors.bullet.value(for: internalState))
                })
                .frame(dimension: uiModel.layout.dimension)
                .padding(uiModel.layout.hitBox)
            }
        )
    }
    
    private var spacer: some View {
        SwiftUIGestureBaseButton(
            onStateChange: stateChangeHandler,
            label: {
                Rectangle()
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: uiModel.layout.radioButtonAndLabelSpacing)
                    .foregroundColor(.clear)
            }
        )
        .disabled(!uiModel.misc.labelIsClickable) // `disabled(:_)` because it's a `SwiftUIGestureBaseButton`
    }
    
    // MARK: Actions
    private func stateChangeHandler(gestureState: GestureBaseButtonGestureState) {
        isPressed = gestureState.isPressed
        
        if gestureState.isClicked {
            playHapticEffect()
            state.setNextState()
        }
    }
    
    // MARK: Haptics
    private func playHapticEffect() {
#if os(iOS)
        HapticManager.shared.playImpact(uiModel.animations.haptic)
#endif
    }
}

// MARK: - Helpers
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VRadioButtonState {
    mutating fileprivate func setNextStateRadio() {
        switch self {
        case .off: self = .on
        case .on: break
        }
    }
}

// MARK: - Preview
// Developmental only
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
struct VRadioButton_Previews: PreviewProvider {
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
    private static var title: String { "Lorem ipsum".pseudoRTL(languageDirection) }

    // Previews (Scenes)
    private struct Preview: View {
        @State private var state: VRadioButtonState = .off
        
        var body: some View {
            PreviewContainer(content: {
                VRadioButton(
                    state: $state,
                    title: title
                )
            })
        }
    }
    
    private struct StatesPreview: View {
        var body: some View {
            PreviewContainer(content: {
                PreviewRow(
                    axis: .horizontal,
                    title: "Off",
                    content: {
                        VRadioButton(
                            state: .constant(.off),
                            title: title
                        )
                    }
                )
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Pressed Off",
                    content: {
                        VRadioButton(
                            uiModel: {
                                var uiModel: VRadioButtonUIModel = .init()
                                uiModel.colors.fill.off = uiModel.colors.fill.pressedOff
                                uiModel.colors.border.off = uiModel.colors.border.pressedOff
                                uiModel.colors.bullet.off = uiModel.colors.bullet.pressedOff
                                uiModel.colors.titleText.off = uiModel.colors.titleText.pressedOff
                                return uiModel
                            }(),
                            state: .constant(.off),
                            title: title
                        )
                    }
                )
                
                PreviewRow(
                    axis: .horizontal,
                    title: "On",
                    content: {
                        VRadioButton(
                            state: .constant(.on),
                            title: title
                        )
                    }
                )
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Pressed On",
                    content: {
                        VRadioButton(
                            uiModel: {
                                var uiModel: VRadioButtonUIModel = .init()
                                uiModel.colors.fill.on = uiModel.colors.fill.pressedOn
                                uiModel.colors.border.on = uiModel.colors.border.pressedOn
                                uiModel.colors.bullet.on = uiModel.colors.bullet.pressedOn
                                uiModel.colors.titleText.on = uiModel.colors.titleText.pressedOn
                                return uiModel
                            }(),
                            state: .constant(.on),
                            title: title
                        )
                    }
                )
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Disabled",
                    content: {
                        VRadioButton(
                            state: .constant(.off),
                            title: title
                        )
                        .disabled(true)
                    }
                )
            })
        }
    }
}
