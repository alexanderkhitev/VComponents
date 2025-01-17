//
//  VStretchedButton.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 03.04.23.
//

import SwiftUI
import VCore

// MARK: - V Stretched Button
/// Large colored button component that performs action when triggered.
///
/// Component can be initialized with title, icon and title, and label.
///
/// UI Model can be passed as parameter.
///
///     var body: some View {
///         VStretchedButton(
///             action: { print("Clicked") },
///             title: "Lorem Ipsum"
///         )
///         .padding()
///     }
///
/// On `macOS` and `watchOS`, you would typically provide an explicit width.
@available(tvOS, unavailable) // Doesn't follow Human Interface Guidelines
public struct VStretchedButton<Label>: View where Label: View {
    // MARK: Properties
    private let uiModel: VStretchedButtonUIModel
    private func internalState(_ baseButtonState: SwiftUIBaseButtonState) -> VStretchedButtonInternalState { baseButtonState }
    private let action: () -> Void
    private let label: VStretchedButtonLabel<Label>
    
    // MARK: Initializers
    /// Initializes `VStretchedButton` with action and title.
    public init(
        uiModel: VStretchedButtonUIModel = .init(),
        action: @escaping () -> Void,
        title: String
    )
        where Label == Never
    {
        self.uiModel = uiModel
        self.action = action
        self.label = .title(title: title)
    }
    
    /// Initializes `VStretchedButton` with action, icon, and title.
    public init(
        uiModel: VStretchedButtonUIModel = .init(),
        action: @escaping () -> Void,
        icon: Image,
        title: String
    )
        where Label == Never
    {
        self.uiModel = uiModel
        self.action = action
        self.label = .iconTitle(icon: icon, title: title)
    }
    
    /// Initializes `VStretchedButton` with action and label.
    public init(
        uiModel: VStretchedButtonUIModel = .init(),
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping (VStretchedButtonInternalState) -> Label
    ) {
        self.uiModel = uiModel
        self.action = action
        self.label = .label(label: label)
    }
    
    // MARK: Body
    public var body: some View {
        SwiftUIBaseButton(
            uiModel: uiModel.baseButtonSubUIModel,
            action: {
                playHapticEffect()
                action()
            },
            label: { baseButtonState in
                let internalState: VStretchedButtonInternalState = internalState(baseButtonState)
                
                buttonLabel(internalState: internalState)
                    .frame(height: uiModel.layout.height)
                    .cornerRadius(uiModel.layout.cornerRadius) // Prevents large content from going out of bounds
                    .background(background(internalState: internalState))
                    .overlay(border(internalState: internalState))
            }
        )
    }
    
    private func buttonLabel(
        internalState: VStretchedButtonInternalState
    ) -> some View {
        Group(content: {
            switch label {
            case .title(let title):
                titleLabelComponent(internalState: internalState, title: title)
                
            case .iconTitle(let icon, let title):
                HStack(spacing: uiModel.layout.iconAndTitleTextSpacing, content: {
                    iconLabelComponent(internalState: internalState, icon: icon)
                    titleLabelComponent(internalState: internalState, title: title)
                })
                
            case .label(let label):
                label(internalState)
            }
        })
        .frame(maxWidth: .infinity)
        .scaleEffect(internalState == .pressed ? uiModel.animations.labelPressedScale : 1)
        .padding(uiModel.layout.labelMargins)
    }
    
    private func titleLabelComponent(
        internalState: VStretchedButtonInternalState,
        title: String
    ) -> some View {
        Text(title)
            .lineLimit(1)
            .minimumScaleFactor(uiModel.layout.titleTextMinimumScaleFactor)
            .foregroundColor(uiModel.colors.titleText.value(for: internalState))
            .font(uiModel.fonts.titleText)
    }
    
    private func iconLabelComponent(
        internalState: VStretchedButtonInternalState,
        icon: Image
    ) -> some View {
        icon
            .resizable()
            .scaledToFit()
            .frame(size: uiModel.layout.iconSize)
            .foregroundColor(uiModel.colors.icon.value(for: internalState))
            .opacity(uiModel.colors.iconOpacities.value(for: internalState))
    }
    
    private func background(
        internalState: VStretchedButtonInternalState
    ) -> some View {
        RoundedRectangle(cornerRadius: uiModel.layout.cornerRadius)
            .scaleEffect(internalState == .pressed ? uiModel.animations.backgroundPressedScale : 1)
            .foregroundColor(uiModel.colors.background.value(for: internalState))
            .shadow(
                color: uiModel.colors.shadow.value(for: internalState),
                radius: uiModel.colors.shadowRadius,
                offset: uiModel.colors.shadowOffset
            )
    }
    
    @ViewBuilder private func border(
        internalState: VStretchedButtonInternalState
    ) -> some View {
        if uiModel.layout.borderWidth > 0 {
            RoundedRectangle(cornerRadius: uiModel.layout.cornerRadius)
                .strokeBorder(uiModel.colors.border.value(for: internalState), lineWidth: uiModel.layout.borderWidth)
                .scaleEffect(internalState == .pressed ? uiModel.animations.backgroundPressedScale : 1)
        }
    }
    
    // MARK: Haptics
    private func playHapticEffect() {
#if os(iOS)
        HapticManager.shared.playImpact(uiModel.animations.haptic)
#elseif os(watchOS)
        HapticManager.shared.playImpact(uiModel.animations.haptic)
#endif
    }
}

// MARK: - Preview
// Developmental only
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@available(tvOS, unavailable)
struct VStretchedButton_Previews: PreviewProvider {
    // Configuration
    private static var languageDirection: LayoutDirection { .leftToRight }
    private static var dynamicTypeSize: DynamicTypeSize? { nil }
    private static var colorScheme: ColorScheme { .light }
    
    // Previews
    static var previews: some View {
        Group(content: {
            Preview().previewDisplayName("*")
            StatesPreview().previewDisplayName("States")
            BorderPreview().previewDisplayName("Border")
            ShadowPreview().previewDisplayName("Shadow")
            OutOfBoundsContentPreventionPreview().previewDisplayName("Out-of-Bounds Content Prevention")
        })
        .colorScheme(colorScheme)
        .environment(\.layoutDirection, languageDirection)
        .applyIfLet(dynamicTypeSize, transform: { $0.dynamicTypeSize($1) })
    }
    
    // Data
    private static var icon: Image { .init(systemName: "swift") }
    private static var title: String {
#if os(watchOS)
        return "Lorem".pseudoRTL(languageDirection)
#else
        "Lorem Ipsum".pseudoRTL(languageDirection)
#endif
    }
    
    // Previews (Scenes)
    private struct Preview: View {
        var body: some View {
            PreviewContainer(content: {
                Group(content: {
                    VStretchedButton(
                        action: {},
                        title: title
                    )

                    VStretchedButton(
                        action: {},
                        icon: icon,
                        title: title
                    )
                })
                .applyModifier({
#if os(iOS)
                    $0
#elseif os(macOS)
                    $0.frame(width: 250)
#elseif os(watchOS)
                    $0.frame(width: 100)
#else
                    fatalError() // Not supported
#endif
                })
                .padding(.horizontal)
            })
        }
    }
    
    private struct StatesPreview: View {
        var body: some View {
            PreviewContainer(
                embeddedInScrollViewOnPlatforms: [.watchOS],
                content: {
                    PreviewRow(
                        axis: .vertical,
                        title: "Enabled",
                        content: {
                            VStretchedButton(
                                action: {},
                                title: title
                            )
                            .applyModifier({
#if os(iOS)
                                $0
#elseif os(macOS)
                                $0.frame(width: 250)
#elseif os(watchOS)
                                $0.frame(width: 100)
#else
                                fatalError() // Not supported
#endif
                            })
                        }
                    )
                    
                    PreviewRow(
                        axis: .vertical,
                        title: "Pressed",
                        content: {
                            VStretchedButton(
                                uiModel: {
                                    var uiModel: VStretchedButtonUIModel = .init()
                                    uiModel.colors.background.enabled = uiModel.colors.background.pressed
                                    uiModel.colors.titleText.enabled = uiModel.colors.titleText.pressed
                                    return uiModel
                                }(),
                                action: {},
                                title: title
                            )
                            .applyModifier({
#if os(iOS)
                                $0
#elseif os(macOS)
                                $0.frame(width: 250)
#elseif os(watchOS)
                                $0.frame(width: 100)
#else
                                fatalError() // Not supported
#endif
                            })
                        }
                    )
                    
                    PreviewRow(
                        axis: .vertical,
                        title: "Disabled",
                        content: {
                            VStretchedButton(
                                action: {},
                                title: title
                            )
                            .applyModifier({
#if os(iOS)
                                $0
#elseif os(macOS)
                                $0.frame(width: 250)
#elseif os(watchOS)
                                $0.frame(width: 100)
#else
                                fatalError() // Not supported
#endif
                            })
                            .disabled(true)
                        }
                    )
                }
            )
        }
    }

    private struct BorderPreview: View {
        var body: some View {
            PreviewContainer(content: {
                VStretchedButton(
                    uiModel: {
                        var uiModel: VStretchedButtonUIModel = .init()
                        uiModel.layout.borderWidth = 2
                        uiModel.colors.border = VStretchedButtonUIModel.Colors.StateColors(
                            enabled: uiModel.colors.background.enabled.darken(by: 0.3),
                            pressed: uiModel.colors.background.enabled.darken(by: 0.3),
                            disabled: .clear
                        )
                        return uiModel
                    }(),
                    action: {},
                    title: title
                )
                .padding(.horizontal)
            })
        }
    }

    private struct ShadowPreview: View {
        var body: some View {
            PreviewContainer(content: {
                VStretchedButton(
                    uiModel: {
                        var uiModel: VStretchedButtonUIModel = .init()
                        uiModel.colors.shadow = VStretchedButtonUIModel.Colors.StateColors(
                            enabled: GlobalUIModel.Common.shadowColorEnabled,
                            pressed: GlobalUIModel.Common.shadowColorEnabled,
                            disabled: GlobalUIModel.Common.shadowColorDisabled
                        )
                        uiModel.colors.shadowRadius = 3
                        uiModel.colors.shadowOffset = CGPoint(x: 0, y: 3)
                        return uiModel
                    }(),
                    action: {},
                    title: title
                )
                .padding(.horizontal)
            })
        }
    }

    private struct OutOfBoundsContentPreventionPreview: View {
        var body: some View {
            PreviewContainer(content: {
                VStretchedButton(
                    uiModel: {
                        var uiModel: VStretchedButtonUIModel = .init()
                        uiModel.layout.iconSize = CGSize(dimension: 100)
                        uiModel.colors.icon = VStretchedButtonUIModel.Colors.StateColors(ColorBook.accentRed)
                        return uiModel
                    }(),
                    action: {},
                    icon: Image(systemName: "swift"),
                    title: title
                )
                .padding()
            })
        }
    }
}
