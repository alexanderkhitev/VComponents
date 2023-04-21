//
//  Deprecations.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 2/12/21.
//

import SwiftUI
import VCore

// MARK: - V Segmented Picker
extension VSegmentedPicker {
    @available(*, unavailable, message: "This `init` is no longer available")
    public init(
        uiModel: VSegmentedPickerUIModel = .init(),
        selectedIndex: Binding<Int>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledIndexes: Set<Int> = [],
        data: Data,
        title: @escaping (Data.Element) -> String
    )
        where
            Content == Never,
            Data: RandomAccessCollection,
            Data.Index == Int
    {
        fatalError()
    }

    @available(*, unavailable, message: "This `init` is no longer available")
    public init(
        uiModel: VSegmentedPickerUIModel = .init(),
        selectedIndex: Binding<Int>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledIndexes: Set<Int> = [],
        data: Data,
        @ViewBuilder content: @escaping (VSegmentedPickerRowInternalState, Data.Element) -> Content
    )
        where
            Data: RandomAccessCollection,
            Data.Index == Int
    {
        fatalError()
    }
}

// MARK: - V Wheel Picker
extension VWheelPicker {
    @available(*, unavailable, message: "This `init` is no longer available")
    public init<Data>(
        uiModel: VWheelPickerUIModel = .init(),
        selectedIndex: Binding<Int>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        data: Data,
        title: @escaping (Data.Element) -> String
    )
        where
            Content == Never,
            Data: RandomAccessCollection,
            Data.Index == Int
    {
        fatalError()
    }

    @available(*, unavailable, message: "This `init` is no longer available")
    public init<Data>(
        uiModel: VWheelPickerUIModel = .init(),
        selectedIndex: Binding<Int>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        data: Data,
        @ViewBuilder content: @escaping (VWheelPickerInternalState, Data.Element) -> Content
    )
        where
            Data: RandomAccessCollection,
            Data.Index == Int
    {
        fatalError()
    }
}

// MARK: - V Sheet
extension VSheetUIModel.Layout {
    @available(*, deprecated, message: "Use `contentMargins` instead")
    public var contentMargin: CGFloat {
        get { (contentMargins.horizontalAverage + contentMargins.verticalAverage)/2 }
        set { contentMargins = .init(newValue) }
    }
}

// MARK: - V Modal
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VModalUIModel.Layout {
    @available(*, unavailable, message: "Use `ignoredContainerSafeAreaEdges` instead")
    public var headerSafeAreaEdges: Edge.Set {
        fatalError()
    }

    @available(*, deprecated, renamed: "ignoredContainerSafeAreaEdgesByContent")
    public var ignoredContainerSafeAreaEdges: Edge.Set {
        get { ignoredContainerSafeAreaEdgesByContent }
        set { ignoredContainerSafeAreaEdgesByContent = newValue }
    }

    @available(*, deprecated, renamed: "ignoredKeyboardSafeAreaEdgesByContent")
    public var ignoredKeyboardSafeAreaEdges: Edge.Set {
        get { ignoredKeyboardSafeAreaEdgesByContent }
        set { ignoredKeyboardSafeAreaEdgesByContent = newValue }
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

// MARK: - V Menu
@available(iOS 15.0, *)
extension VMenuPickerSection {
    @available(*, unavailable, message: "This `init` is no longer available")
    public init<Data>(
        title: String? = nil,
        selectedIndex: Binding<Int>,
        data: Data,
        content: @escaping (Data.Element) -> VMenuRowProtocol
    )
        where
            Data: RandomAccessCollection,
            Data.Index == Int
    {
        fatalError()
    }

    @available(*, unavailable, message: "This `init` is no longer available")
    public init(
        title: String? = nil,
        selectedIndex: Binding<Int>,
        rowTitles: [String]
    )
        where
            Data: RandomAccessCollection,
            Data.Index == Int
    {
        fatalError()
    }
}

// MARK: - V Side Bar
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VSideBarUIModel.Layout {
    @available(*, unavailable, message: "Use `ignoredContainerSafeAreaEdges` instead")
    public var contentSafeAreaEdges: Edge.Set {
        fatalError()
    }

    @available(*, deprecated, renamed: "ignoredContainerSafeAreaEdgesByContent")
    public var ignoredContainerSafeAreaEdges: Edge.Set {
        get { ignoredContainerSafeAreaEdgesByContent }
        set { ignoredContainerSafeAreaEdgesByContent = newValue }
    }

    @available(*, deprecated, renamed: "ignoredKeyboardSafeAreaEdgesByContent")
    public var ignoredKeyboardSafeAreaEdges: Edge.Set {
        get { ignoredKeyboardSafeAreaEdgesByContent }
        set { ignoredKeyboardSafeAreaEdgesByContent = newValue }
    }
}

// MARK: - V Alert
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VAlertUIModel.Layout {
    @available(*, deprecated, renamed: "ignoredKeyboardSafeAreaEdgesByContent")
    public var ignoredKeyboardSafeAreaEdges: Edge.Set {
        get { ignoredKeyboardSafeAreaEdgesByContent }
        set { ignoredKeyboardSafeAreaEdgesByContent = newValue }
    }
}
