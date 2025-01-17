//
//  VModal.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 1/13/21.
//

import SwiftUI
import VCore

// MARK: - V Modal
@available(iOS 14.0, *)
@available(macOS 11.0, *)@available(macOS, unavailable) // No `View.presentationHost(...)` support
@available(tvOS 16.0, *)@available(tvOS, unavailable) // No `View.presentationHost(...)` support
@available(watchOS 7.0, *)@available(watchOS, unavailable) // No `View.presentationHost(...)` support
struct VModal<Content>: View
    where Content: View
{
    // MARK: Properties
    @Environment(\.layoutDirection) private var layoutDirection: LayoutDirection
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Environment(\.presentationHostPresentationMode) private var presentationMode: PresentationHostPresentationMode
    @StateObject private var interfaceOrientationChangeObserver: InterfaceOrientationChangeObserver = .init()
    
    private let uiModel: VModalUIModel
    
    private let presentHandler: (() -> Void)?
    private let dismissHandler: (() -> Void)?
    
    @State private var headerLabel: VModalHeaderLabel<AnyView> = VModalHeaderLabelPreferenceKey.defaultValue
    private let content: () -> Content
    
    private var hasHeader: Bool { headerLabel.hasLabel || uiModel.misc.dismissType.hasButton }
    private var hasDivider: Bool { hasHeader && uiModel.layout.dividerHeight > 0 }
    
    @State private var isInternallyPresented: Bool = false
    
    // MARK: Initializers
    init(
        uiModel: VModalUIModel,
        onPresent presentHandler: (() -> Void)?,
        onDismiss dismissHandler: (() -> Void)?,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.uiModel = uiModel
        self.presentHandler = presentHandler
        self.dismissHandler = dismissHandler
        self.content = content
    }
    
    // MARK: Body
    var body: some View {
        ZStack(content: {
            dimmingView
            modal
        })
        .environment(\.colorScheme, uiModel.colors.colorScheme ?? colorScheme)
        .onAppear(perform: animateIn)
        .onChange(
            of: presentationMode.isExternallyDismissed,
            perform: { if $0 && isInternallyPresented { animateOutFromExternalDismiss() } }
        )
        .onPreferenceChange(VModalHeaderLabelPreferenceKey.self, perform: {
            headerLabel = $0
        })
    }
    
    private var dimmingView: some View {
        uiModel.colors.dimmingView
            .ignoresSafeArea()
            .onTapGesture(perform: {
                if uiModel.misc.dismissType.contains(.backTap) { animateOut() }
            })
    }

    private var modal: some View {
        ZStack(content: {
            VGroupBox(uiModel: uiModel.groupBoxSubUIModel)
                .ignoresSafeArea(.container, edges: uiModel.layout.ignoredContainerSafeAreaEdgesByContainer)
                .ignoresSafeArea(.keyboard, edges: uiModel.layout.ignoredKeyboardSafeAreaEdgesByContainer)
                .shadow(
                    color: uiModel.colors.shadow,
                    radius: uiModel.colors.shadowRadius,
                    offset: uiModel.colors.shadowOffset
                )

            VStack(spacing: 0, content: {
                header
                divider
                contentView
            })
            .cornerRadius( // Fixes issue of content-clipping, as it's not in `VGroupBox`
                uiModel.layout.cornerRadius,
                corners: uiModel.layout.roundedCorners
                    .withReversedLeftAndRightCorners(
                        uiModel.layout.reversesLeftAndRightCornersForRTLLanguages &&
                        layoutDirection == .rightToLeft
                    )
            )
            .ignoresSafeArea(.container, edges: uiModel.layout.ignoredContainerSafeAreaEdgesByContent)
            .ignoresSafeArea(.keyboard, edges: uiModel.layout.ignoredKeyboardSafeAreaEdgesByContent)
        })
        .frame( // Max dimension fix issue of safe areas and/or landscape
            maxWidth: uiModel.layout.sizes._current.size.width,
            maxHeight: uiModel.layout.sizes._current.size.height
        )
        .scaleEffect(isInternallyPresented ? 1 : uiModel.animations.scaleEffect)
        .blur(radius: isInternallyPresented ? 0 : uiModel.animations.blur)
    }
    
    @ViewBuilder private var header: some View {
        if hasHeader {
            HStack(
                alignment: uiModel.layout.headerAlignment,
                spacing: uiModel.layout.labelAndCloseButtonSpacing,
                content: {
                    Group(content: {
                        if uiModel.misc.dismissType.contains(.leadingButton) {
                            closeButton
                        } else if uiModel.misc.dismissType.contains(.trailingButton) {
                            closeButtonCompensator
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Group(content: {
                        switch headerLabel {
                        case .empty:
                            EmptyView()

                        case .title(let title):
                            Text(title)
                                .lineLimit(1)
                                .foregroundColor(uiModel.colors.headerTitleText)
                                .font(uiModel.fonts.headerTitleText)

                        case .label(let label):
                            label()
                        }
                    })
                    .layoutPriority(1)

                    Group(content: {
                        if uiModel.misc.dismissType.contains(.trailingButton) {
                            closeButton
                        } else if uiModel.misc.dismissType.contains(.leadingButton) {
                            closeButtonCompensator
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            )
            .padding(uiModel.layout.headerMargins)
        }
    }

    private var closeButton: some View {
        VRoundedButton(
            uiModel: uiModel.closeButtonSubUIModel,
            action: animateOut,
            icon: ImageBook.xMark
        )
    }

    private var closeButtonCompensator: some View {
        Spacer()
            .frame(width: uiModel.layout.closeButtonSubUIModel.size.width)
    }
    
    @ViewBuilder private var divider: some View {
        if hasDivider {
            Rectangle()
                .frame(height: uiModel.layout.dividerHeight)
                .padding(uiModel.layout.dividerMargins)
                .foregroundColor(uiModel.colors.divider)
        }
    }
    
    private var contentView: some View {
        content()
            .padding(uiModel.layout.contentMargins)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: Animations
    private func animateIn() {
        withBasicAnimation(
            uiModel.animations.appear,
            body: { isInternallyPresented = true },
            completion: {
                DispatchQueue.main.async(execute: { presentHandler?() })
            }
        )
    }
    
    private func animateOut() {
        withBasicAnimation(
            uiModel.animations.disappear,
            body: { isInternallyPresented = false },
            completion: {
                presentationMode.dismiss()
                DispatchQueue.main.async(execute: { dismissHandler?() })
            }
        )
    }
    
    private func animateOutFromExternalDismiss() {
        withBasicAnimation(
            uiModel.animations.disappear,
            body: { isInternallyPresented = false },
            completion: {
                presentationMode.externalDismissCompletion()
                DispatchQueue.main.async(execute: { dismissHandler?() })
            }
        )
    }
}

// MARK: - Previews
// Developmental only
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
struct VModal_Previews: PreviewProvider {
    // Configuration
    private static var interfaceOrientation: InterfaceOrientation { .portrait }
    private static var languageDirection: LayoutDirection { .leftToRight }
    private static var dynamicTypeSize: DynamicTypeSize? { nil }
    private static var colorScheme: ColorScheme { .light }
    
    // Previews
    static var previews: some View {
        Group(content: {
            Preview().previewDisplayName("*")
            InsettedContentPreview().previewDisplayName("Insetted Content")
            FullSizedContentPreview().previewDisplayName("Full-Sized Content")
        })
        .previewInterfaceOrientation(interfaceOrientation)
        .environment(\.layoutDirection, languageDirection)
        .applyIfLet(dynamicTypeSize, transform: { $0.dynamicTypeSize($1) })
        .colorScheme(colorScheme)
    }
    
    // Data
    private static func content() -> some View {
        ColorBook.accentBlue
            .vModalHeaderTitle("Lorem Ipsum".pseudoRTL(languageDirection))
    }
    
    // Previews (Scenes)
    private struct Preview: View {
        var body: some View {
            PreviewContainer(content: {
                VModal(
                    uiModel: {
                        var uiModel: VModalUIModel = .init()
                        uiModel.animations.appear = nil
                        return uiModel
                    }(),
                    onPresent: nil,
                    onDismiss: nil,
                    content: content
                )
            })
        }
    }
    
    private struct InsettedContentPreview: View {
        var body: some View {
            PreviewContainer(content: {
                VModal(
                    uiModel: {
                        var uiModel: VModalUIModel = .insettedContent
                        uiModel.animations.appear = nil
                        return uiModel
                    }(),
                    onPresent: nil,
                    onDismiss: nil,
                    content: content
                )
            })
        }
    }
    
    private struct FullSizedContentPreview: View {
        var body: some View {
            PreviewContainer(content: {
                VModal(
                    uiModel: {
                        var uiModel: VModalUIModel = .fullSizedContent
                        uiModel.animations.appear = nil
                        return uiModel
                    }(),
                    onPresent: nil,
                    onDismiss: nil,
                    content: { ColorBook.accentBlue }
                )
            })
        }
    }
}
