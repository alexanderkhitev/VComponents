//
//  VPlainButton.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI
import VCore

// MARK: - V Plain Button
/// Plain button component that performs action when triggered.
///
/// Component can be initialized with title, icon, icon and title, and label.
///
/// UI Model can be passed as parameter.
///
///     var body: some View {
///         VPlain(
///             action: { print("Clicked") },
///             title: "Lorem Ipsum"
///         )
///     }
///
@available(tvOS, unavailable) // Doesn't follow Human Interface Guidelines
@available(watchOS, unavailable)
public struct VPlainButton<Label>: View where Label: View {
    // MARK: Properties
    private let uiModel: VPlainButtonUIModel
    private func internalState(_ baseButtonState: SwiftUIBaseButtonState) -> VCapsuleButtonInternalState { baseButtonState }
    private let action: () -> Void
    private let label: VPlainButtonLabel<Label>

    // MARK: Initializers
    /// Initializes `VPlainButton` with action and title.
    public init(
        uiModel: VPlainButtonUIModel = .init(),
        action: @escaping () -> Void,
        title: String
    )
        where Label == Never
    {
        self.uiModel = uiModel
        self.action = action
        self.label = .title(title: title)
    }
    
    /// Initializes `VPlainButton` with action and icon.
    public init(
        uiModel: VPlainButtonUIModel = .init(),
        action: @escaping () -> Void,
        icon: Image
    )
        where Label == Never
    {
        self.uiModel = uiModel
        self.action = action
        self.label = .icon(icon: icon)
    }
    
    /// Initializes `VPlainButton` with action, icon, and title.
    public init(
        uiModel: VPlainButtonUIModel = .init(),
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
    
    /// Initializes `VPlainButton` with action and label.
    public init(
        uiModel: VPlainButtonUIModel = .init(),
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping (VPlainButtonInternalState) -> Label
    ) {
        self.uiModel = uiModel
        self.action = action
        self.label = .label(label: label)
    }

    // MARK: Body
    public var body: some View {
        SwiftUIBaseButton(
            uiModel: uiModel.baseButtonSubUIModel,
            action: action,
            label: { baseButtonState in
                let internalState: VPlainButtonInternalState = internalState(baseButtonState)
                
                buttonLabel(internalState: internalState)
                    .padding(uiModel.layout.hitBox)
            }
        )
    }
    
    @ViewBuilder private func buttonLabel(
        internalState: VPlainButtonInternalState
    ) -> some View {
        switch label {
        case .title(let title):
            labelTitleComponent(internalState: internalState, title: title)
            
        case .icon(let icon):
            labelIconComponent(internalState: internalState, icon: icon)
            
        case .iconTitle(let icon, let title):
            HStack(spacing: uiModel.layout.iconTitleSpacing, content: {
                labelIconComponent(internalState: internalState, icon: icon)
                labelTitleComponent(internalState: internalState, title: title)
            })
            
        case .label(let label):
            label(internalState)
        }
    }
    
    private func labelTitleComponent(
        internalState: VPlainButtonInternalState,
        title: String
    ) -> some View {
        VText(
            minimumScaleFactor: uiModel.layout.titleMinimumScaleFactor,
            color: uiModel.colors.title.value(for: internalState),
            font: uiModel.fonts.title,
            text: title
        )
    }
    
    private func labelIconComponent(
        internalState: VPlainButtonInternalState,
        icon: Image
    ) -> some View {
        icon
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(size: uiModel.layout.iconSize)
            .foregroundColor(uiModel.colors.icon.value(for: internalState))
            .opacity(uiModel.colors.iconOpacities.value(for: internalState))
    }
}

// MARK: - Preview
@available(tvOS, unavailable)
@available(watchOS, unavailable)
struct VPlainButton_Previews: PreviewProvider {
    // Configuration
    private static var colorScheme: ColorScheme { .light }
    
    // Previews
    static var previews: some View {
        Group(content: {
            Preview().previewDisplayName("*")
            StatesPreview().previewDisplayName("States")
        })
            .colorScheme(colorScheme)
    }
    
    // Data
    private static var title: String { "Lorem Ipsum" }
    
    // Previews (Scenes)
    private struct Preview: View {
        var body: some View {
            PreviewContainer(content: {
                VPlainButton(
                    action: { print("Clicked") },
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
                    title: "Enabled",
                    content: {
                        VPlainButton(
                            action: {},
                            title: title
                        )
                    }
                )
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Pressed",
                    content: {
                        VPlainButton(
                            uiModel: {
                                var uiModel: VPlainButtonUIModel = .init()
                                uiModel.colors.title.enabled = uiModel.colors.title.pressed
                                return uiModel
                            }(),
                            action: {},
                            title: title
                        )
                    }
                )
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Disabled",
                    content: {
                        VPlainButton(
                            action: {},
                            title: title
                        )
                            .disabled(true)
                    }
                )
                
                PreviewSectionHeader("Native")
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Enabled",
                    content: {
                        Button(
                            title,
                            action: {}
                        )
                            .buttonStyle(.plain)
                            .foregroundColor(ColorBook.accentBlue)
                    }
                )
                
                PreviewRow(
                    axis: .horizontal,
                    title: "Disabled",
                    content: {
                        Button(
                            title,
                            action: {}
                        )
                            .buttonStyle(.plain)
                            .disabled(true)
                    }
                )
            })
        }
    }
}
