//
//  VSideBarExtension.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/24/20.
//

import SwiftUI
import VCore

// MARK: - Bool
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {
    /// Presents side bar when boolean is `true`.
    ///
    /// Side bar component that draws a from edge with background, and hosts content.
    ///
    /// UI Model, and present and dismiss handlers can be passed as parameters.
    ///
    /// `vSideBar` modifier can be used on any view down the view hierarchy, as content overlay will always be overlayed on the screen.
    ///
    ///     @State private var isPresented: Bool = false
    ///
    ///     var body: some View {
    ///         VPlainButton(
    ///             action: { isPresented = true },
    ///             title: "Present"
    ///         )
    ///         .vSideBar(
    ///             id: "some_side_bar",
    ///             isPresented: $isPresented,
    ///             content: {
    ///                 ColorBook.accentBlue
    ///             }
    ///         )
    ///     }
    ///
    public func vSideBar(
        id: String,
        uiModel: VSideBarUIModel = .init(),
        isPresented: Binding<Bool>,
        onPresent presentHandler: (() -> Void)? = nil,
        onDismiss dismissHandler: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        self
            .presentationHost(
                id: id,
                isPresented: isPresented,
                content: {
                    VSideBar(
                        uiModel: uiModel,
                        onPresent: presentHandler,
                        onDismiss: dismissHandler,
                        content: content
                    )
                }
            )
    }
}

// MARK: - Item
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {
    /// Presents side bar using the item as data source for content.
    ///
    /// Side bar component that draws a from edge with background, and hosts content.
    ///
    /// UI Model, and present and dismiss handlers can be passed as parameters.
    ///
    /// `vSideBar` modifier can be used on any view down the view hierarchy, as content overlay will always be overlayed on the screen.
    ///
    ///     struct SideBarItem: Identifiable {
    ///         let id: UUID = .init()
    ///     }
    ///
    ///     @State private var sideBarItem: SideBarItem?
    ///
    ///     var body: some View {
    ///         VPlainButton(
    ///             action: { sideBarItem = SideBarItem() },
    ///             title: "Present"
    ///         )
    ///         .vSideBar(
    ///             id: "some_side_bar",
    ///             item: $sideBarItem,
    ///             content: {
    ///                 ColorBook.accentBlue
    ///             }
    ///         )
    ///     }
    ///
    public func vSideBar<Item>(
        id: String,
        uiModel: VSideBarUIModel = .init(),
        item: Binding<Item?>,
        onPresent presentHandler: (() -> Void)? = nil,
        onDismiss dismissHandler: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (Item) -> some View
    ) -> some View
        where Item: Identifiable
    {
        item.wrappedValue.map { PresentationHostDataSourceCache.shared.set(key: id, value: $0) }
        
        return self
            .presentationHost(
                id: id,
                item: item,
                content: {
                    VSideBar(
                        uiModel: uiModel,
                        onPresent: presentHandler,
                        onDismiss: dismissHandler,
                        content: {
                            if let item = item.wrappedValue ?? PresentationHostDataSourceCache.shared.get(key: id) as? Item {
                                content(item)
                            }
                        }
                    )
                }
            )
    }
}
