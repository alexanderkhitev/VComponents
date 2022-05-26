//
//  VSideBarExtension.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/24/20.
//

import SwiftUI

// MARK: - Bool
extension View {
    /// Presents `VSideBar` when boolean is `true`.
    ///
    /// Side bar component that draws a from left side with background, and hosts content.
    ///
    /// Model, and present and dismiss handlers can be passed as parameters.
    ///
    /// `vSideBar` modifier can be used on any view down the view hierarchy, as content overlay will always be overlayed on the screen.
    ///
    ///     @State var isPresented: Bool = false
    ///
    ///     var body: some View {
    ///         VPlainButton(
    ///             action: { isPresented = true },
    ///             title: "Present"
    ///         )
    ///             .vSideBar(
    ///                 isPresented: $isPresented,
    ///                 content: {
    ///                     VList(data: 0..<20, content: { num in
    ///                         Text(String(num))
    ///                             .frame(maxWidth: .infinity, alignment: .leading)
    ///                     })
    ///                 }
    ///             )
    ///     }
    ///
    public func vSideBar<Content>(
        model: VSideBarModel = .init(),
        isPresented: Binding<Bool>,
        onPresent presentHandler: (() -> Void)? = nil,
        onDismiss dismissHandler: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View
        where Content: View
    {
        self
            .onDisappear(perform: { PresentationHost.forceDismiss(in: self) })
            .background(PresentationHost(
                in: self,
                isPresented: isPresented,
                content: {
                    VSideBar(
                        model: model,
                        onPresent: presentHandler,
                        onDismiss: dismissHandler,
                        content: content
                    )
                }
            ))
    }
}

// MARK: - Item
extension View {
    /// Presents `VSideBar` using the item as data source for content.
    ///
    /// Side bar component that draws a from left side with background, and hosts content.
    ///
    /// Model, and present and dismiss handlers can be passed as parameters.
    ///
    /// `vSideBar` modifier can be used on any view down the view hierarchy, as content overlay will always be overlayed on the screen.
    ///
    ///     struct SideBarItem: Identifiable {
    ///         let id: UUID = .init()
    ///     }
    ///
    ///     @State var sideBarItem: SideBarItem?
    ///
    ///     var body: some View {
    ///         VPlainButton(
    ///             action: { sideBarItem = .init() },
    ///             title: "Present"
    ///         )
    ///             .vSideBar(
    ///                 item: $sideBarItem,
    ///                 content: { item in
    ///                     VList(data: 0..<20, content: { num in
    ///                         Text(String(num))
    ///                             .frame(maxWidth: .infinity, alignment: .leading)
    ///                     })
    ///                 }
    ///             )
    ///     }
    ///
    public func vSideBar<Item, Content>(
        model: VSideBarModel = .init(),
        item: Binding<Item?>,
        onPresent presentHandler: (() -> Void)? = nil,
        onDismiss dismissHandler: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View
        where
            Item: Identifiable,
            Content: View
    {
        item.wrappedValue.map { PresentationHostDataSourceCache.shared.set(key: self, value: $0) }

        return self
            .onDisappear(perform: { PresentationHost.forceDismiss(in: self) })
            .background(PresentationHost(
                in: self,
                isPresented: .init(
                    get: { item.wrappedValue != nil },
                    set: { if !$0 { item.wrappedValue = nil } }
                ),
                content: {
                    VSideBar(
                        model: model,
                        onPresent: presentHandler,
                        onDismiss: dismissHandler,
                        content: {
                            if let item = item.wrappedValue ?? PresentationHostDataSourceCache.shared.get(key: self) as? Item {
                                content(item)
                            }
                        }
                    )
                }
            ))
    }
}