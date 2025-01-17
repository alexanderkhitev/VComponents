//
//  Deprecations.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 2/12/21.
//

import SwiftUI
import VCore

// MARK: - V Stretched Button
@available(tvOS, unavailable)
extension VStretchedButtonUIModel.Layout {
    @available(*, deprecated, renamed: "titleTextMinimumScaleFactor")
    public var titleMinimumScaleFactor: CGFloat {
        get { titleTextMinimumScaleFactor }
        set { titleTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "iconAndTitleTextSpacing")
    public var iconTitleSpacing: CGFloat {
        get { iconAndTitleTextSpacing }
        set { iconAndTitleTextSpacing = newValue }
    }
}

@available(tvOS, unavailable)
extension VStretchedButtonUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var title: StateColors {
        get { titleText }
        set { titleText = newValue }
    }
}

@available(tvOS, unavailable)
extension VStretchedButtonUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var title: Font {
        get { titleText }
        set { titleText = newValue }
    }
}

// MARK: - V Loading Stretched Button
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VLoadingStretchedButtonUIModel.Layout {
    @available(*, deprecated, renamed: "titleTextMinimumScaleFactor")
    public var titleMinimumScaleFactor: CGFloat {
        get { titleTextMinimumScaleFactor }
        set { titleTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "iconAndTitleTextSpacing")
    public var iconTitleSpacing: CGFloat {
        get { iconAndTitleTextSpacing }
        set { iconAndTitleTextSpacing = newValue }
    }

    @available(*, deprecated, renamed: "labelAndSpinnerSpacing")
    public var labelSpinnerSpacing: CGFloat {
        get { labelAndSpinnerSpacing }
        set { labelAndSpinnerSpacing = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VLoadingStretchedButtonUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var title: StateColors {
        get { titleText }
        set { titleText = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VLoadingStretchedButtonUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var title: Font {
        get { titleText }
        set { titleText = newValue }
    }
}

// MARK: - V Capsule Button
@available(tvOS, unavailable)
extension VCapsuleButtonUIModel.Layout {
    @available(*, deprecated, renamed: "titleTextMinimumScaleFactor")
    public var titleMinimumScaleFactor: CGFloat {
        get { titleTextMinimumScaleFactor }
        set { titleTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "iconAndTitleTextSpacing")
    public var iconTitleSpacing: CGFloat {
        get { iconAndTitleTextSpacing }
        set { iconAndTitleTextSpacing = newValue }
    }
}

@available(tvOS, unavailable)
extension VCapsuleButtonUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var title: StateColors {
        get { titleText }
        set { titleText = newValue }
    }
}

@available(tvOS, unavailable)
extension VCapsuleButtonUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var title: Font {
        get { titleText }
        set { titleText = newValue }
    }
}

// MARK: - V Rounded Caption Button
@available(macOS, unavailable)
@available(tvOS, unavailable)
extension VRoundedCaptionButtonUIModel.Layout {
    @available(*, deprecated, renamed: "titleCaptionTextMinimumScaleFactor")
    public var titleCaptionMinimumScaleFactor: CGFloat {
        get { titleCaptionTextMinimumScaleFactor }
        set { titleCaptionTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "rectangleAndCaptionSpacing")
    public var rectangleCaptionSpacing: CGFloat {
        get { rectangleAndCaptionSpacing }
        set { rectangleAndCaptionSpacing = newValue }
    }

    @available(*, deprecated, renamed: "iconCaptionAndTitleCaptionTextSpacing")
    public var captionSpacing: CGFloat {
        get { iconCaptionAndTitleCaptionTextSpacing }
        set { iconCaptionAndTitleCaptionTextSpacing = newValue }
    }
}

@available(macOS, unavailable)
@available(tvOS, unavailable)
extension VRoundedCaptionButtonUIModel.Colors {
    @available(*, deprecated, renamed: "titleCaptionText")
    public var titleCaption: StateColors {
        get { titleCaptionText }
        set { titleCaptionText = newValue }
    }
}

@available(macOS, unavailable)
@available(tvOS, unavailable)
extension VRoundedCaptionButtonUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var titleCaption: Font {
        get { titleCaptionText }
        set { titleCaptionText = newValue }
    }
}

// MARK: - V Plain Button
@available(tvOS, unavailable)
extension VPlainButtonUIModel.Layout {
    @available(*, deprecated, renamed: "titleTextMinimumScaleFactor")
    public var titleMinimumScaleFactor: CGFloat {
        get { titleTextMinimumScaleFactor }
        set { titleTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "iconAndTitleTextSpacing")
    public var iconTitleSpacing: CGFloat {
        get { iconAndTitleTextSpacing }
        set { iconAndTitleTextSpacing = newValue }
    }
}

@available(tvOS, unavailable)
extension VPlainButtonUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var title: StateColors {
        get { titleText }
        set { titleText = newValue }
    }
}

@available(tvOS, unavailable)
extension VPlainButtonUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var title: Font {
        get { titleText }
        set { titleText = newValue }
    }
}

// MARK: - V Toggle
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VToggleUIModel.Layout {
    @available(*, deprecated, renamed: "titleTextMinimumScaleFactor")
    public var titleMinimumScaleFactor: CGFloat {
        get { titleTextMinimumScaleFactor }
        set { titleTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "toggleAndLabelSpacing")
    public var toggleLabelSpacing: CGFloat {
        get { toggleAndLabelSpacing }
        set { toggleAndLabelSpacing = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VToggleUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var title: StateColors {
        get { titleText }
        set { titleText = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VToggleUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var title: Font {
        get { titleText }
        set { titleText = newValue }
    }
}

// MARK: - V CheckBox
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VCheckBoxUIModel.Layout {
    @available(*, deprecated, renamed: "checkmarkIconDimension")
    public var iconDimension: CGFloat {
        get { checkmarkIconDimension }
        set { checkmarkIconDimension = newValue }
    }

    @available(*, deprecated, renamed: "titleTextMinimumScaleFactor")
    public var titleMinimumScaleFactor: CGFloat {
        get { titleTextMinimumScaleFactor }
        set { titleTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "checkBoxAndLabelSpacing")
    public var checkBoxLabelSpacing: CGFloat {
        get { checkBoxAndLabelSpacing }
        set { checkBoxAndLabelSpacing = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VCheckBoxUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var title: StateColors {
        get { titleText }
        set { titleText = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VCheckBoxUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var title: Font {
        get { titleText }
        set { titleText = newValue }
    }
}

// MARK: - V Radio Button
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VRadioButtonUIModel.Layout {
    @available(*, deprecated, renamed: "titleTextMinimumScaleFactor")
    public var titleMinimumScaleFactor: CGFloat {
        get { titleTextMinimumScaleFactor }
        set { titleTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "radioButtonAndLabelSpacing")
    public var radioLabelSpacing: CGFloat {
        get { radioButtonAndLabelSpacing }
        set { radioButtonAndLabelSpacing = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VRadioButtonUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var title: StateColors {
        get { titleText }
        set { titleText = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VRadioButtonUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var title: Font {
        get { titleText }
        set { titleText = newValue }
    }
}

// MARK: - V Rounded Button
@available(tvOS, unavailable)
extension VRoundedButtonUIModel.Layout {
    @available(*, deprecated, renamed: "titleTextMinimumScaleFactor")
    public var titleMinimumScaleFactor: CGFloat {
        get { titleTextMinimumScaleFactor }
        set { titleTextMinimumScaleFactor = newValue }
    }
}

@available(tvOS, unavailable)
extension VRoundedButtonUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var title: StateColors {
        get { titleText }
        set { titleText = newValue }
    }
}

@available(tvOS, unavailable)
extension VRoundedButtonUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var title: Font {
        get { titleText }
        set { titleText = newValue }
    }
}

// MARK: - V Segmented Picker
@available(tvOS, unavailable)
@available(watchOS, unavailable)
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

    @available(*, deprecated, message: "Use `init` with `id`")
    public init<SelectionValue>(
        uiModel: VSegmentedPickerUIModel = .init(),
        selection: Binding<SelectionValue>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledValues: Set<SelectionValue> = [],
        title: @escaping (SelectionValue) -> String
    )
        where
            Data == Array<SelectionValue>,
            SelectionValue: CaseIterable,
            ID == Int,
            Content == Never
    {
        self.init(
            uiModel: uiModel,
            selection: selection,
            headerTitle: headerTitle,
            footerTitle: footerTitle,
            disabledValues: disabledValues,
            data: Array(SelectionValue.allCases),
            id: \.hashValue,
            title: title
        )
    }

    @available(*, deprecated, message: "Use `init` with `id`")
    public init<SelectionValue>(
        uiModel: VSegmentedPickerUIModel = .init(),
        selection: Binding<SelectionValue>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledValues: Set<SelectionValue> = [],
        @ViewBuilder content: @escaping (VSegmentedPickerRowInternalState, SelectionValue) -> Content
    )
        where
            Data == Array<SelectionValue>,
            SelectionValue: CaseIterable,
            ID == Int
    {
        self.init(
            uiModel: uiModel,
            selection: selection,
            headerTitle: headerTitle,
            footerTitle: footerTitle,
            disabledValues: disabledValues,
            data: Array(SelectionValue.allCases),
            id: \.hashValue,
            content: content
        )
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VSegmentedPickerUIModel.Layout {
    @available(*, deprecated, renamed: "headerPickerAndFooterSpacing")
    public var headerPickerFooterSpacing: CGFloat {
        get { headerPickerAndFooterSpacing }
        set { headerPickerAndFooterSpacing = newValue }
    }

    @available(*, deprecated, renamed: "headerAndFooterMarginHorizontal")
    public var headerFooterMarginHorizontal: CGFloat {
        get { headerAndFooterMarginHorizontal }
        set { headerAndFooterMarginHorizontal = newValue }
    }

    @available(*, deprecated, renamed: "rowTitleTextMinimumScaleFactor")
    public var rowTitleMinimumScaleFactor: CGFloat {
        get { rowTitleTextMinimumScaleFactor }
        set { rowTitleTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleTextLineType")
    public var headerTextLineType: TextLineType {
        get { headerTitleTextLineType }
        set { headerTitleTextLineType = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleTextLineType")
    public var footerTextLineType: TextLineType {
        get { footerTitleTextLineType }
        set { footerTitleTextLineType = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VSegmentedPickerUIModel.Colors {
    @available(*, deprecated, renamed: "rowTitleText")
    public var rowTitle: RowStateColors {
        get { rowTitleText }
        set { rowTitleText = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleText")
    public var header: StateColors {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleText")
    public var footer: StateColors {
        get { footerTitleText }
        set { footerTitleText = newValue }
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VSegmentedPickerUIModel.Fonts {
    @available(*, deprecated, renamed: "rowTitleText")
    public var rows: Font {
        get { rowTitleText }
        set { rowTitleText = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleText")
    public var header: Font {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleText")
    public var footer: Font {
        get { footerTitleText }
        set { footerTitleText = newValue }
    }
}

// MARK: - V Wheel Picker
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VWheelPicker {
    @available(*, unavailable, message: "This `init` is no longer available")
    public init(
        uiModel: VWheelPickerUIModel = .init(),
        selectedIndex: Binding<Int>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        data: Data,
        title: @escaping (Data.Element) -> String
    )
        where
            Data.Index == Int,
            Content == Never
    {
        fatalError()
    }

    @available(*, unavailable, message: "This `init` is no longer available")
    public init(
        uiModel: VWheelPickerUIModel = .init(),
        selectedIndex: Binding<Int>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        data: Data,
        @ViewBuilder content: @escaping (VWheelPickerInternalState, Data.Element) -> Content
    )
        where Data.Index == Int
    {
        fatalError()
    }

    @available(*, deprecated, message: "Use `init` with `id`")
    public init<SelectionValue>(
        uiModel: VWheelPickerUIModel = .init(),
        selection: Binding<SelectionValue>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        title: @escaping (SelectionValue) -> String
    )
        where
            Data == Array<SelectionValue>,
            SelectionValue: CaseIterable,
            ID == Int,
            Content == Never
    {
        self.init(
            uiModel: uiModel,
            selection: selection,
            headerTitle: headerTitle,
            footerTitle: footerTitle,
            data: Array(SelectionValue.allCases),
            id: \.hashValue,
            title: title
        )
    }

    @available(*, deprecated, message: "Use `init` with `id`")
    public init<SelectionValue>(
        uiModel: VWheelPickerUIModel = .init(),
        selection: Binding<SelectionValue>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        @ViewBuilder content: @escaping (VWheelPickerInternalState, SelectionValue) -> Content
    )
        where
            Data == Array<SelectionValue>,
            SelectionValue: CaseIterable,
            ID == Int
    {
        self.init(
            uiModel: uiModel,
            selection: selection,
            headerTitle: headerTitle,
            footerTitle: footerTitle,
            data: Array(SelectionValue.allCases),
            id: \.hashValue,
            content: content
        )
    }
}

@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VWheelPickerUIModel.Layout {
    @available(*, deprecated, renamed: "headerPickerAndFooterSpacing")
    public var headerPickerFooterSpacing: CGFloat {
        get { headerPickerAndFooterSpacing }
        set { headerPickerAndFooterSpacing = newValue }
    }

    @available(*, deprecated, renamed: "headerAndFooterMarginHorizontal")
    public var headerFooterMarginHorizontal: CGFloat {
        get { headerAndFooterMarginHorizontal }
        set { headerAndFooterMarginHorizontal = newValue }
    }

    @available(*, deprecated, renamed: "rowTitleTextMinimumScaleFactor")
    public var titleMinimumScaleFactor: CGFloat {
        get { rowTitleTextMinimumScaleFactor }
        set { rowTitleTextMinimumScaleFactor = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleTextLineType")
    public var headerTextLineType: TextLineType {
        get { headerTitleTextLineType }
        set { headerTitleTextLineType = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleTextLineType")
    public var footerTextLineType: TextLineType {
        get { footerTitleTextLineType }
        set { footerTitleTextLineType = newValue }
    }
}

@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VWheelPickerUIModel.Colors {
    @available(*, deprecated, renamed: "rowTitleText")
    public var title: StateColors {
        get { rowTitleText }
        set { rowTitleText = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleText")
    public var header: StateColors {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleText")
    public var footer: StateColors {
        get { footerTitleText }
        set { footerTitleText = newValue }
    }
}

@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VWheelPickerUIModel.Fonts {
    @available(*, deprecated, renamed: "rowTitleText")
    public var rows: Font {
        get { rowTitleText }
        set { rowTitleText = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleText")
    public var header: Font {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleText")
    public var footer: Font {
        get { footerTitleText }
        set { footerTitleText = newValue }
    }
}

// MARK: - V Text Field
@available(iOS 15.0, *)
@available(macOS 12.0, *)@available(macOS, unavailable)
@available(tvOS 15.0, *)@available(tvOS, unavailable)
@available(watchOS 8.0, *)@available(watchOS, unavailable)
extension VTextFieldUIModel.Layout {
    @available(*, deprecated, renamed: "textAndButtonSpacing")
    public var contentSpacing: CGFloat {
        get { textAndButtonSpacing }
        set { textAndButtonSpacing = newValue }
    }

    @available(*, deprecated, renamed: "headerAndFooterMarginHorizontal")
    public var headerFooterMarginHorizontal: CGFloat {
        get { headerAndFooterMarginHorizontal }
        set { headerAndFooterMarginHorizontal = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleTextLineType")
    public var headerTextLineType: TextLineType {
        get { headerTitleTextLineType }
        set { headerTitleTextLineType = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleTextLineType")
    public var footerTextLineType: TextLineType {
        get { footerTitleTextLineType }
        set { footerTitleTextLineType = newValue }
    }

    @available(*, deprecated, renamed: "headerTextFieldAndFooterSpacing")
    public var headerTextFieldFooterSpacing: CGFloat {
        get { headerTextFieldAndFooterSpacing }
        set { headerTextFieldAndFooterSpacing = newValue }
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)@available(macOS, unavailable)
@available(tvOS 15.0, *)@available(tvOS, unavailable)
@available(watchOS 8.0, *)@available(watchOS, unavailable)
extension VTextFieldUIModel.Colors {
    @available(*, deprecated, renamed: "placeholderText")
    public var placeholder: StateColors {
        get { placeholderText }
        set { placeholderText = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleText")
    public var header: StateColors {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleText")
    public var footer: StateColors {
        get { footerTitleText }
        set { footerTitleText = newValue }
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)@available(macOS, unavailable)
@available(tvOS 15.0, *)@available(tvOS, unavailable)
@available(watchOS 8.0, *)@available(watchOS, unavailable)
extension VTextFieldUIModel.Fonts {
    @available(*, deprecated, renamed: "placeholderText")
    public var placeholder: Font {
        get { placeholderText }
        set { placeholderText = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleText")
    public var header: Font {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleText")
    public var footer: Font {
        get { footerTitleText }
        set { footerTitleText = newValue }
    }
}

// MARK: - V Text View
@available(iOS 16.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VTextViewUIModel.Layout {
    @available(*, deprecated, renamed: "headerTextViewAndFooterSpacing")
    public var headerTextViewFooterSpacing: CGFloat {
        get { headerTextViewAndFooterSpacing }
        set { headerTextViewAndFooterSpacing = newValue }
    }

    @available(*, deprecated, renamed: "headerAndFooterMarginHorizontal")
    public var headerFooterMarginHorizontal: CGFloat {
        get { headerAndFooterMarginHorizontal }
        set { headerAndFooterMarginHorizontal = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleTextLineType")
    public var headerTextLineType: TextLineType {
        get { headerTitleTextLineType }
        set { headerTitleTextLineType = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleTextLineType")
    public var footerTextLineType: TextLineType {
        get { footerTitleTextLineType }
        set { footerTitleTextLineType = newValue }
    }
}

@available(iOS 16.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VTextViewUIModel.Colors {
    @available(*, deprecated, renamed: "placeholderText")
    public var placeholder: StateColors {
        get { placeholderText }
        set { placeholderText = newValue }
    }

    @available(*, deprecated, renamed: "headerTitleText")
    public var header: StateColors {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }

    @available(*, deprecated, renamed: "footerTitleText")
    public var footer: StateColors {
        get { footerTitleText }
        set { footerTitleText = newValue }
    }
}

// MARK: - V Group Box
@available(*, deprecated, renamed: "VGroupBox")
public typealias VSheet = VGroupBox

@available(*, deprecated, renamed: "VGroupBox")
public typealias VSheetUIModel = VGroupBoxUIModel

extension VGroupBoxUIModel.Layout {
    @available(*, deprecated, message: "Use `contentMargins` instead")
    public var contentMargin: CGFloat {
        get { (contentMargins.horizontalAverage + contentMargins.verticalAverage)/2 }
        set { contentMargins = .init(newValue) }
    }
}

// MARK: - V Disclosure Group
@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VDisclosureGroupUIModel.Colors {
    @available(*, deprecated, renamed: "headerTitleText")
    public var headerTitle: StateColors {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }
}

@available(iOS 14.0, macOS 11.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VDisclosureGroupUIModel.Fonts {
    @available(*, deprecated, renamed: "headerTitleText")
    public var headerTitle: Font {
        get { headerTitleText }
        set { headerTitleText = newValue }
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

    @available(*, deprecated, renamed: "labelAndCloseButtonSpacing")
    public var labelCloseButtonSpacing: CGFloat {
        get { labelAndCloseButtonSpacing }
        set { labelAndCloseButtonSpacing = newValue }
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

@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VModalUIModel.Colors {
    @available(*, deprecated, renamed: "headerTitleText")
    public var headerTitle: Color {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }
}

@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VModalUIModel.Fonts {
    @available(*, deprecated, renamed: "headerTitleText")
    public var header: Font {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }
}

@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VModalUIModel.Animations {
    @available(*, deprecated, message: "Property no longer has an effect since it messed with animation")
    public var opacity: Double {
        get { 0.5 }
        set {}
    }
}

// MARK: - V Bottom Sheet
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VBottomSheetUIModel.Layout {
    @available(*, deprecated, renamed: "labelAndCloseButtonSpacing")
    public var labelCloseButtonSpacing: CGFloat {
        get { labelAndCloseButtonSpacing }
        set { labelAndCloseButtonSpacing = newValue }
    }
}

@available(iOS 14.0, *)
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

@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VBottomSheetUIModel.Colors {
    @available(*, deprecated, renamed: "headerTitleText")
    public var headerTitle: Color {
        get { headerTitleText }
        set { headerTitleText = newValue }
    }
}

@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VBottomSheetUIModel.Fonts {
    @available(*, deprecated, renamed: "headerTitleText")
    public var header: Font {
        get { headerTitleText }
        set { headerTitleText = newValue }
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
@available(*, deprecated, message: "Use `VAlertButton` with `role` instead")
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct VAlertPrimaryButton: VAlertButtonProtocol {
    private var isEnabled: Bool = true
    private let action: (() -> Void)?
    private let title: String

    public init(
        action: (() -> Void)?,
        title: String
    ) {
        self.action = action
        self.title = title
    }

    public func makeBody(
        uiModel: VAlertUIModel,
        animateOut: @escaping (/*completion*/ (() -> Void)?) -> Void
    ) -> AnyView {
        .init(
            VStretchedButton(
                uiModel: uiModel.primaryButtonSubUIModel,
                action: { animateOut(/*completion: */action) },
                title: title
            )
            .disabled(!isEnabled)
        )
    }

    public func disabled(_ disabled: Bool) -> Self {
        var button = self
        button.isEnabled = !disabled
        return button
    }
}

@available(*, deprecated, message: "Use `VAlertButton` with `role` instead")
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct VAlertSecondaryButton: VAlertButtonProtocol {
    private var isEnabled: Bool = true
    private let action: (() -> Void)?
    private let title: String

    public init(
        action: (() -> Void)?,
        title: String
    ) {
        self.action = action
        self.title = title
    }

    public func makeBody(
        uiModel: VAlertUIModel,
        animateOut: @escaping (/*completion*/ (() -> Void)?) -> Void
    ) -> AnyView {
        .init(
            VStretchedButton(
                uiModel: uiModel.secondaryButtonSubUIModel,
                action: { animateOut(/*completion: */action) },
                title: title
            )
            .disabled(!isEnabled)
        )
    }

    public func disabled(_ disabled: Bool) -> Self {
        var button = self
        button.isEnabled = !disabled
        return button
    }
}

@available(*, deprecated, message: "Use `VAlertButton` with `role` instead")
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct VAlertOKButton: VAlertButtonProtocol {
    private var isEnabled: Bool = true
    private let action: (() -> Void)?
    private let title: String

    public init(
        action: (() -> Void)?,
        title: String? = nil
    ) {
        self.action = action
        self.title = title ?? VComponentsLocalizationManager.shared.localizationProvider.vAlertOKButtonTitle
    }

    public func makeBody(
        uiModel: VAlertUIModel,
        animateOut: @escaping (/*completion*/ (() -> Void)?) -> Void
    ) -> AnyView {
        .init(
            VStretchedButton(
                uiModel: uiModel.secondaryButtonSubUIModel,
                action: { animateOut(/*completion: */action) },
                title: title
            )
            .disabled(!isEnabled)
        )
    }

    public func disabled(_ disabled: Bool) -> Self {
        var button = self
        button.isEnabled = !disabled
        return button
    }
}

@available(*, deprecated, message: "Use `VAlertButton` with `role` instead")
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct VAlertDestructiveButton: VAlertButtonProtocol {
    private var isEnabled: Bool = true
    private let action: (() -> Void)?
    private let title: String

    public init(
        action: (() -> Void)?,
        title: String
    ) {
        self.action = action
        self.title = title
    }

    public func makeBody(
        uiModel: VAlertUIModel,
        animateOut: @escaping (/*completion*/ (() -> Void)?) -> Void
    ) -> AnyView {
        .init(
            VStretchedButton(
                uiModel: uiModel.destructiveButtonSubUIModel,
                action: { animateOut(/*completion: */action) },
                title: title
            )
            .disabled(!isEnabled)
        )
    }

    public func disabled(_ disabled: Bool) -> Self {
        var button = self
        button.isEnabled = !disabled
        return button
    }
}

@available(*, deprecated, message: "Use `VAlertButton` with `role` instead")
@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct VAlertCancelButton: VAlertButtonProtocol {
    private var isEnabled: Bool = true
    private let action: (() -> Void)?
    private let title: String

    public init(
        action: (() -> Void)?,
        title: String? = nil
    ) {
        self.action = action
        self.title = title ?? VComponentsLocalizationManager.shared.localizationProvider.vAlertCancelButtonTitle
    }

    public func makeBody(
        uiModel: VAlertUIModel,
        animateOut: @escaping (/*completion*/ (() -> Void)?) -> Void
    ) -> AnyView {
        .init(
            VStretchedButton(
                uiModel: uiModel.secondaryButtonSubUIModel,
                action: { animateOut(/*completion: */action) },
                title: title
            )
            .disabled(!isEnabled)
        )
    }

    public func disabled(_ disabled: Bool) -> Self {
        var button = self
        button.isEnabled = !disabled
        return button
    }
}

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

    @available(*, deprecated, renamed: "titleTextMessageTextAndContentMargins")
    public var titleMessageContentMargins: Margins {
        get { titleTextMessageTextAndContentMargins }
        set { titleTextMessageTextAndContentMargins = newValue }
    }

    @available(*, deprecated, renamed: "titleTextMargins")
    public var titleMargins: Margins {
        get { titleTextMargins }
        set { titleTextMargins = newValue }
    }

    @available(*, deprecated, renamed: "messageTextMargins")
    public var messageMargins: Margins {
        get { messageTextMargins }
        set { messageTextMargins = newValue }
    }
}

@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VAlertUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var title: Color {
        get { titleText }
        set { titleText = newValue }
    }

    @available(*, deprecated, renamed: "messageText")
    public var message: Color {
        get { messageText }
        set { messageText = newValue }
    }
}

@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VAlertUIModel.Fonts {
    @available(*, deprecated, renamed: "titleText")
    public var title: Font {
        get { titleText }
        set { titleText = newValue }
    }

    @available(*, deprecated, renamed: "messageText")
    public var message: Font {
        get { messageText }
        set { messageText = newValue }
    }
}

@available(iOS 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VAlertUIModel.Animations {
    @available(*, deprecated, message: "Property no longer has an effect since it messed with animation")
    public var opacity: Double {
        get { 0.5 }
        set {}
    }
}

// MARK: - V Confirmation Dialog
@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public protocol VConfirmationDialogButtonProtocol: VConfirmationDialogButtonConvertible {
    typealias Body = AnyView

    func makeBody() -> Body
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension VConfirmationDialogButtonProtocol {
    public func toButtons() -> [any VConfirmationDialogButtonProtocol] { [self] }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct VConfirmationDialogButton: VConfirmationDialogButtonProtocol {
    private var isEnabled: Bool = true
    private let action: (() -> Void)?
    private let title: String

    public init(
        action: (() -> Void)?,
        title: String
    ) {
        self.action = action
        self.title = title
    }

    public func makeBody() -> AnyView {
        .init(
            Button(
                title,
                role: nil,
                action: { action?() }
            )
            .disabled(!isEnabled)
        )
    }

    public func disabled(_ disabled: Bool) -> Self {
        var row = self
        row.isEnabled = !disabled
        return row
    }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct VConfirmationDialogOKButton: VConfirmationDialogButtonProtocol {
    private var isEnabled: Bool = true
    private let title: String
    private let action: (() -> Void)?

    public init(
        action: (() -> Void)?,
        title: String? = nil
    ) {
        self.action = action
        self.title = title ?? VComponentsLocalizationManager.shared.localizationProvider.vConfirmationDialogOKButtonTitle
    }

    public func disabled(_ disabled: Bool) -> Self {
        var row = self
        row.isEnabled = !disabled
        return row
    }

    public func makeBody() -> AnyView {
        .init(
            Button(
                title,
                role: nil,
                action: { action?() }
            )
            .disabled(!isEnabled)
        )
    }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct VConfirmationDialogDestructiveButton: VConfirmationDialogButtonProtocol {
    private var isEnabled: Bool = true
    private let action: (() -> Void)?
    private let title: String

    public init(
        action: (() -> Void)?,
        title: String
    ) {
        self.action = action
        self.title = title
    }

    public func makeBody() -> AnyView {
        AnyView(
            Button(
                title,
                role: .destructive,
                action: { action?() }
            )
            .disabled(!isEnabled)
        )
    }

    public func disabled(_ disabled: Bool) -> Self {
        var row = self
        row.isEnabled = !disabled
        return row
    }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct VConfirmationDialogCancelButton: VConfirmationDialogButtonProtocol {
    private var isEnabled: Bool = true
    private let action: (() -> Void)?
    private let title: String

    public init(
        action: (() -> Void)?,
        title: String? = nil
    ) {
        self.action = action
        self.title = title ?? VComponentsLocalizationManager.shared.localizationProvider.vConfirmationDialogCancelButtonTitle
    }

    public func makeBody() -> AnyView {
        .init(
            Button(
                title,
                role: .cancel,
                action: { action?() }
            )
            .disabled(!isEnabled)
        )
    }

    public func disabled(_ disabled: Bool) -> Self {
        var row = self
        row.isEnabled = !disabled
        return row
    }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public protocol VConfirmationDialogButtonConvertible {
    func toButtons() -> [any VConfirmationDialogButtonProtocol]
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Array: VConfirmationDialogButtonConvertible where Element == any VConfirmationDialogButtonProtocol {
    public func toButtons() -> [any VConfirmationDialogButtonProtocol] { self }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension EmptyView: VConfirmationDialogButtonConvertible {
    public func toButtons() -> [any VConfirmationDialogButtonProtocol] { [] }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@resultBuilder public struct VConfirmationDialogButtonBuilder {
    public typealias Component = any VConfirmationDialogButtonConvertible
    public typealias Result = [any VConfirmationDialogButtonProtocol]

    public static func buildBlock() -> Result {
        []
    }

    public static func buildBlock(_ components: Component...) -> Result {
        components.flatMap { $0.toButtons() }
    }

    public static func buildOptional(_ component: Component?) -> Result {
        component?.toButtons() ?? []
    }

    public static func buildEither(first component: Component) -> Result {
        component.toButtons()
    }

    public static func buildEither(second component: Component) -> Result {
        component.toButtons()
    }

    public static func buildArray(_ components: [Component]) -> Result {
        components.flatMap { $0.toButtons() }
    }

    public static func buildLimitedAvailability(_ component: Component) -> Result {
        component.toButtons()
    }

    public static func buildFinalResult(_ component: Component) -> Result {
        component.toButtons()
    }

    static func process(_ buttons: [any VConfirmationDialogButtonProtocol]) -> [any VConfirmationDialogButtonProtocol] {
        var result: [any VConfirmationDialogButtonProtocol] = []

        for button in buttons {
            if button is VConfirmationDialogCancelButton { result.removeAll(where: { $0 is VConfirmationDialogCancelButton }) }
            result.append(button)
        }
        if let cancelButtonIndex: Int = result.firstIndex(where: { $0 is VConfirmationDialogCancelButton }) {
            result.append(result.remove(at: cancelButtonIndex))
        }

        if result.isEmpty {
            result.append(VConfirmationDialogCancelButton(
                action: nil,
                title: VComponentsLocalizationManager.shared.localizationProvider.vConfirmationDialogOKButtonTitle
            ))
        }

        return result
    }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
struct VConfirmationDialogContentView: View {
    let buttons: [any VConfirmationDialogButtonProtocol]

    init(button: [any VConfirmationDialogButtonProtocol]) {
        self.buttons = VConfirmationDialogButtonBuilder.process(button)
    }

    var body: some View {
        ForEach(buttons.indices, id: \.self, content: { i in
            buttons[i].makeBody()
        })
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    @available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
    public func vConfirmationDialog(
        isPresented: Binding<Bool>,
        title: String?,
        message: String?,
        @VConfirmationDialogButtonBuilder actions buttons: @escaping () -> [any VConfirmationDialogButtonProtocol]
    ) -> some View {
        self
            .confirmationDialog(
                title ?? "",
                isPresented: isPresented,
                titleVisibility: .vConfirmationDialog(title: title, message: message),
                actions: { VConfirmationDialogContentView(button: buttons()) },
                message: {
                    if let message {
                        Text(message)
                    }
                }
            )
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    @available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
    public func vConfirmationDialog<Item>(
        item: Binding<Item?>,
        title: @escaping (Item) -> String?,
        message: @escaping (Item) -> String?,
        @VConfirmationDialogButtonBuilder actions buttons: @escaping (Item) -> [any VConfirmationDialogButtonProtocol]
    ) -> some View
        where Item: Identifiable
    {
        self
            .confirmationDialog(
                item.wrappedValue.flatMap { title($0) } ?? "",
                isPresented: Binding(
                    get: { item.wrappedValue != nil },
                    set: { if !$0 { item.wrappedValue = nil } }
                ),
                titleVisibility: .vConfirmationDialog(
                    title: item.wrappedValue.flatMap { title($0) },
                    message: item.wrappedValue.flatMap { message($0) }
                ),
                actions: {
                    if let item = item.wrappedValue {
                        VConfirmationDialogContentView(button: buttons(item))
                    }
                },
                message: {
                    if let item = item.wrappedValue, let message = message(item) {
                        Text(message)
                    }
                }
            )
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    @available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
    public func vConfirmationDialog<T>(
        isPresented: Binding<Bool>,
        presenting data: T?,
        title: @escaping (T) -> String?,
        message: @escaping (T) -> String?,
        @VConfirmationDialogButtonBuilder actions buttons: @escaping (T) -> [any VConfirmationDialogButtonProtocol]
    ) -> some View {
        self
            .confirmationDialog(
                data.flatMap { title($0) } ?? "",
                isPresented: Binding(
                    get: { isPresented.wrappedValue && data != nil },
                    set: { if !$0 { isPresented.wrappedValue = false } }
                ),
                titleVisibility: .vConfirmationDialog(
                    title: data.flatMap { title($0) },
                    message: data.flatMap { message($0) }
                ),
                actions: {
                    if let data {
                        VConfirmationDialogContentView(button: buttons(data))
                    }
                },
                message: {
                    if let data, let message = message(data) {
                        Text(message)
                    }
                }
            )
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Visibility {
    @available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
    fileprivate static func vConfirmationDialog(title: String?, message: String?) -> Self {
        switch (title, message) {
        case (nil, nil): return .hidden
        case (nil, _?): return .visible
        case (_?, nil): return .visible
        case (_?, _?): return .visible
        }
    }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    public func vConfirmationDialog(
        parameters: Binding<VConfirmationDialogParameters?>
    ) -> some View {
        self.vConfirmationDialog(
            item: parameters,
            title: { $0.title },
            message: { $0.message },
            actions: { $0.buttons() }
        )
    }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct VConfirmationDialogParameters: Identifiable {
    public let id: UUID = .init()
    public var title: String?
    public var message: String?

    public var buttons: () -> [any VConfirmationDialogButtonProtocol]

    public init(
        title: String?,
        message: String?,
        @VConfirmationDialogButtonBuilder actions buttons: @escaping () -> [any VConfirmationDialogButtonProtocol]
    ) {
        self.title = title
        self.message = message
        self.buttons = buttons
    }
}

@available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@MainActor public protocol VConfirmationDialogPresentable: ObservableObject {
    var vConfirmationDialogParameters: VConfirmationDialogParameters? { get set }
}

extension VComponentsLocalizationProvider {
    @available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
    var vConfirmationDialogOKButtonTitle: String { "Ok" }

    @available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
    var vConfirmationDialogCancelButtonTitle: String { "Cancel" }
}

extension DefaultVComponentsLocalizationProvider {
    @available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
    public var vConfirmationDialogOKButtonTitle: String { "Ok" }

    @available(*, deprecated, message: "VConfirmationDialog is obsolete. Use `ConfirmationDialog` from `VCore` instead")
    public var vConfirmationDialogCancelButtonTitle: String { "Cancel" }
}

// MARK: - V Menu
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VMenuPickerSection {
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

    @available(*, deprecated, message: "Use `init` with `id`")
    public init<SelectionValue>(
        title: String? = nil,
        selection: Binding<SelectionValue>,
        content: @escaping (SelectionValue) -> VMenuPickerRowProtocol
    )
        where
            Data == Array<SelectionValue>,
            SelectionValue: CaseIterable,
            ID == Int
    {
        self.init(
            title: title,
            selection: selection,
            data: Array(SelectionValue.allCases),
            id: \.hashValue,
            content: content
        )
    }
}

@available(*, deprecated, renamed: "VMenuRow")
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public typealias VMenuTitleRow = VMenuRow

@available(*, deprecated, renamed: "VMenuRow")
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS 15.0, *)@available(tvOS, unavailable)
@available(watchOS 8.0, *)@available(watchOS, unavailable)
public struct VMenuTitleIconRow: VMenuGroupRowProtocol {
    private var isEnabled: Bool = true
    private let action: () -> Void
    private let role: ButtonRole?
    private let title: String
    private let icon: Image

    public init(
        action: @escaping () -> Void,
        role: ButtonRole? = nil,
        title: String,
        icon: Image
    ) {
        self.action = action
        self.role = role
        self.title = title
        self.icon = icon
    }

    public init(
        action: @escaping () -> Void,
        role: ButtonRole? = nil,
        title: String,
        assetIcon: String,
        bundle: Bundle? = nil
    ) {
        self.action = action
        self.role = role
        self.title = title
        self.icon = Image(assetIcon, bundle: bundle)
    }

    public init(
        action: @escaping () -> Void,
        role: ButtonRole? = nil,
        title: String,
        systemIcon: String
    ) {
        self.action = action
        self.role = role
        self.title = title
        self.icon = Image(systemName: systemIcon)
    }

    public func makeBody() -> AnyView {
        .init(
            Button(
                role: role,
                action: action,
                label: {
                    Text(title)
                    icon
                }
            )
            .disabled(!isEnabled)
        )
    }

    public func disabled(_ disabled: Bool) -> Self {
        var button = self
        button.isEnabled = !disabled
        return button
    }
}

@available(*, deprecated, renamed: "VMenuExpandingRow")
@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public typealias VMenuSubMenuRow = VMenuExpandingRow

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS 14.0, *)@available(tvOS, unavailable)
@available(watchOS 7, *)@available(watchOS, unavailable)
extension VMenuPickerSection {
    @available(*, unavailable, message: "Use init with `VMenuPickerRow` instead")
    public init(
        title: String? = nil,
        selection: Binding<Data.Element>,
        data: Data,
        id: KeyPath<Data.Element, ID>,
        content: @escaping (Data.Element) -> VMenuGroupRowProtocol
    ) {
        fatalError()
    }

    @available(*, unavailable, message: "Use init with `VMenuPickerRow` instead")
    public init(
        title: String? = nil,
        selection: Binding<Data.Element>,
        data: Data,
        content: @escaping (Data.Element) -> VMenuGroupRowProtocol
    )
        where
            Data.Element: Identifiable,
            ID == Data.Element.ID
    {
        fatalError()
    }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VMenuSectionProtocol {
    @available(*, deprecated, renamed: "headerTitle")
    var title: String? { headerTitle }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VMenuGroupSection {
    @available(*, deprecated, message: "Use init with `headerTitle`")
    public init(
        title: String?,
        @VMenuGroupRowBuilder rows: @escaping () -> [any VMenuGroupRowProtocol]
    ) {
        self.init(
            headerTitle: title,
            rows: rows
        )
    }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VMenuPickerSection {
    @available(*, deprecated, message: "Use init with `headerTitle`")
    public init(
        title: String?,
        selection: Binding<Data.Element>,
        data: Data,
        id: KeyPath<Data.Element, ID>,
        content: @escaping (Data.Element) -> VMenuPickerRowProtocol
    ) {
        self.init(
            headerTitle: title,
            selection: selection,
            data: data,
            id: id,
            rows: content
        )
    }

    @available(*, deprecated, message: "Use init with `headerTitle`")
    public init(
        title: String?,
        selection: Binding<Data.Element>,
        data: Data,
        content: @escaping (Data.Element) -> VMenuPickerRowProtocol
    )
        where
            Data.Element: Identifiable,
            ID == Data.Element.ID
    {
        self.init(
            headerTitle: title,
            selection: selection,
            data: data,
            rows: content
        )
    }

    @available(*, deprecated, message: "Use init with `headerTitle`")
    public init<T>(
        title: String?,
        selection: Binding<T>
    )
        where
            Data == Array<T>,
            T: Identifiable & CaseIterable & StringRepresentable,
            ID == T.ID
    {
        self.init(
            headerTitle: title,
            selection: selection
        )
    }
}

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension VMenuUIModel.Colors {
    @available(*, deprecated, renamed: "titleText")
    public var label: StateColors {
        get { titleText }
        set { titleText = newValue }
    }
}

// MARK: - V Text
@available(*, deprecated, message: "Use native `Text` instead.")
public struct VText: View {
    private let textLineType: TextLineType
    private let truncatingMode: Text.TruncationMode
    private let minimumScaleFactor: CGFloat
    private let color: Color
    private let font: Font
    private let text: String

    public init(
        type textLineType: TextLineType = .singleLine,
        truncatingMode: Text.TruncationMode = .tail,
        minimumScaleFactor: CGFloat = 0,
        color: Color,
        font: Font,
        text: String
    ) {
        self.textLineType = textLineType
        self.truncatingMode = truncatingMode
        self.minimumScaleFactor = minimumScaleFactor
        self.color = color
        self.font = font
        self.text = text
    }

    public var body: some View {
        Text(text)
            .multilineTextAlignment(textLineType.textAlignment ?? .leading)
            .lineLimit(type: textLineType.textLineLimitType)
            .minimumScaleFactor(minimumScaleFactor)
            .foregroundColor(color)
            .font(font)
    }
}

//.truncationMode(truncatingMode)
