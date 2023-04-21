//
//  Deprecations.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 2/12/21.
//

import SwiftUI
import VCore

// MARK: - V Sheet
extension VSheetUIModel.Layout {
    @available(*, deprecated, message: "Use `contentMargins` instead")
    public var contentMargin: CGFloat {
        get { (contentMargins.horizontalAverage + contentMargins.verticalAverage)/2 }
        set { contentMargins = .init(newValue) }
    }
}

// MARK: - V Modal
@available(iOS 15.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VModalUIModel.Layout {
    @available(*, unavailable, message: "Use `ignoredContainerSafeAreaEdges` instead")
    public var headerSafeAreaEdges: Edge.Set {
        fatalError()
    }
}

// MARK: - V Bottom Sheet
@available(iOS 15.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VBottomSheetUIModel.Layout.BottomSheetHeights {
    @available(*, deprecated, message: "Use `init` instead")
    public static func fixed(_ value: CGFloat) -> Self {
        .init(
            min: value,
            ideal: value,
            max: value
        )
    }
}

// MARK: - V Side Bar
@available(iOS 15.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VSideBarUIModel.Layout {
    @available(*, unavailable, message: "Use `ignoredContainerSafeAreaEdges` instead")
    public var contentSafeAreaEdges: Edge.Set {
        fatalError()
    }
}
