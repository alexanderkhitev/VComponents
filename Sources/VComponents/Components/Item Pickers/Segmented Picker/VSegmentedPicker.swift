//
//  VSegmentedPicker.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 1/7/21.
//

import SwiftUI
import VCore

// MARK: - V Segmented Picker
/// Item picker component that selects from a set of mutually exclusive values, and displays their representative content horizontally.
///
/// Best suited for `2` – `3` items.
///
/// UI Model, header, footer, and disabled indexes can be passed as parameters.
///
/// There are four possible ways of initializing `VSegmentedPicker`.
///
/// [1] Data, Index, and Title/Content:
///
///     private enum SomeEnum: CaseIterable {
///         case red, green, blue
///     }
///
///     @State private var selectedIndex: Int = 0
///
///     var body: some View {
///         VSegmentedPicker(
///             selectedIndex: $selectedIndex,
///             data: SomeEnum.allCases,
///             title: { String(describing: $0) }
///         )
///     }
///
///     or
///
///     var body: some View {
///         VSegmentedPicker(
///             selectedIndex: $selectedIndex,
///             data: SomeEnum.allCases,
///             content: { (internalState, value) in Text(String(describing: value)) } // Requires custom state-management
///         )
///     }
///
/// [2] Data, Selection, and Title/Content:
///
///     private enum SomeEnum: CaseIterable {
///         case red, green, blue
///     }
///
///     @State private var selection: SomeEnum = .red
///
///     var body: some View {
///         VSegmentedPicker(
///             selection: $selection,
///             data: SomeEnum.allCases,
///             title: { String(describing: $0) }
///         )
///     }
///
///     or
///
///     var body: some View {
///         VSegmentedPicker(
///             selection: $selection,
///             data: SomeEnum.allCases,
///             content: { (internalState, value) in Text(String(describing: value)) } // Requires custom state-management
///         )
///     }
///
/// [3] `HashableEnumeration` API - Title/Content:
///
///     private enum SomeEnum: HashableEnumeration {
///         case red, green, blue
///     }
///
///     @State private var selection: SomeEnum = .red
///
///     var body: some View {
///         VSegmentedPicker(
///             selection: $selection,
///             title: { String(describing: $0) }
///         )
///     }
///
///     or
///
///     var body: some View {
///         VSegmentedPicker(
///             selection: $selection,
///             content: { (internalState, value) in Text(String(describing: value)) } // Requires custom state-management
///         )
///     }
///
/// [4] `StringRepresentableHashableEnumeration` API:
///
///     private enum SomeEnum: StringRepresentableHashableEnumeration {
///         case red, green, blue
///
///         var stringRepresentation: String {
///             String(describing: self)
///         }
///     }
///
///     @State private var selection: SomeEnum = .red
///
///     var body: some View {
///         VSegmentedPicker(
///             selection: $selection
///         )
///     }
///
@available(tvOS, unavailable) // Doesn't follow Human Interface Guidelines. No `SwiftUIGestureBaseButton` support.
@available(watchOS, unavailable)
public struct VSegmentedPicker<Data, Content>: View
    where
        Data: RandomAccessCollection,
        Data.Index == Int,
        Content: View
{
    // MARK: Properties
    private let uiModel: VSegmentedPickerUIModel
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    @State private var pressedIndex: Int?
    private var internalState: VSegmentedPickerInternalState { .init(isEnabled: isEnabled) }
    private var indicatorInternalState: VSegmentedPickerSelectionIndicatorInternalState {
        .init(
            isEnabled: isEnabled, // `isEnabled` check is required
            isPressed: pressedIndex == selectedIndex
        )
    }
    private func rowInternalState(i: Int) -> VSegmentedPickerRowInternalState {
        .init(
            isEnabled: isEnabled && !disabledIndexes.contains(i), // `isEnabled` check is required
            isSelected: selectedIndex == i,
            isPressed: pressedIndex == i
        )
    }
    
    @Binding private var selectedIndex: Int
    
    private let headerTitle: String?
    private let footerTitle: String?
    private let disabledIndexes: Set<Int>
    
    private let content: VSegmentedPickerContent<Data, Content>
    
    @State private var rowWidth: CGFloat = 0
    
    // MARK: Initializers - Index
    /// Initializes `VSegmentedPicker` with selected index, data, and row title.
    public init(
        uiModel: VSegmentedPickerUIModel = .init(),
        selectedIndex: Binding<Int>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledIndexes: Set<Int> = [],
        data: Data,
        title: @escaping (Data.Element) -> String
    )
        where Content == Never
    {
        self.uiModel = uiModel
        self._selectedIndex = selectedIndex
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.disabledIndexes = disabledIndexes
        self.content = .title(data: data, title: title)
    }
    
    /// Initializes `VSegmentedPicker` with selected index, data, and row content.
    public init(
        uiModel: VSegmentedPickerUIModel = .init(),
        selectedIndex: Binding<Int>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledIndexes: Set<Int> = [],
        data: Data,
        @ViewBuilder content: @escaping (VSegmentedPickerRowInternalState, Data.Element) -> Content
    ) {
        self.uiModel = uiModel
        self._selectedIndex = selectedIndex
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.disabledIndexes = disabledIndexes
        self.content = .content(data: data, content: content)
    }
    
    // MARK: Initializers - Hashable
    /// Initializes `VSegmentedPicker` with selection value, data, and row title.
    public init<SelectionValue>(
        uiModel: VSegmentedPickerUIModel = .init(),
        selection: Binding<SelectionValue>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledIndexes: Set<Int> = [],
        data: Data,
        title: @escaping (Data.Element) -> String
    )
        where
            Data == Array<SelectionValue>,
            Content == Never,
            SelectionValue: Hashable
    {
        self.uiModel = uiModel
        self._selectedIndex = Binding(
            get: { data.firstIndex(of: selection.wrappedValue)! }, // Force-unwrap
            set: { selection.wrappedValue = data[$0] }
        )
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.disabledIndexes = disabledIndexes
        self.content = .title(data: data, title: title)
    }
    
    /// Initializes `VSegmentedPicker` with selection value, data, and row content.
    public init<SelectionValue>(
        uiModel: VSegmentedPickerUIModel = .init(),
        selection: Binding<SelectionValue>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledIndexes: Set<Int> = [],
        data: Data,
        @ViewBuilder content: @escaping (VSegmentedPickerRowInternalState, Data.Element) -> Content
    )
        where
            Data == Array<SelectionValue>,
            SelectionValue: Hashable
    {
        self.uiModel = uiModel
        self._selectedIndex = Binding(
            get: { data.firstIndex(of: selection.wrappedValue)! }, // Force-unwrap
            set: { selection.wrappedValue = data[$0] }
        )
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.disabledIndexes = disabledIndexes
        self.content = .content(data: data, content: content)
    }
    
    // MARK: Initializers - Hashable Enumeration
    /// Initializes `VSegmentedPicker` with `HashableEnumeration` and row title.
    public init<T>(
        uiModel: VSegmentedPickerUIModel = .init(),
        selection: Binding<T>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledIndexes: Set<Int> = [],
        title: @escaping (T) -> String
    )
        where
            Data == Array<T>,
            Content == Never,
            T: HashableEnumeration
    {
        self.uiModel = uiModel
        self._selectedIndex = Binding(
            get: { Array(T.allCases).firstIndex(of: selection.wrappedValue)! }, // Force-unwrap
            set: { selection.wrappedValue = Array(T.allCases)[$0] }
        )
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.disabledIndexes = disabledIndexes
        self.content = .title(data: Array(T.allCases), title: title)
    }
    
    /// Initializes `VSegmentedPicker` with `HashableEnumeration` and row content.
    public init<T>(
        uiModel: VSegmentedPickerUIModel = .init(),
        selection: Binding<T>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledIndexes: Set<Int> = [],
        @ViewBuilder content: @escaping (VSegmentedPickerRowInternalState, T) -> Content
    )
        where
            Data == Array<T>,
            T: HashableEnumeration
    {
        self.uiModel = uiModel
        self._selectedIndex = Binding(
            get: { Array(T.allCases).firstIndex(of: selection.wrappedValue)! }, // Force-unwrap
            set: { selection.wrappedValue = Array(T.allCases)[$0] }
        )
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.disabledIndexes = disabledIndexes
        self.content = .content(data: Array(T.allCases), content: content)
    }
    
    // MARK: Initializers - String Representable Hashable Enumeration
    /// Initializes `VSegmentedPicker` with `StringRepresentableHashableEnumeration`.
    public init<T>(
        uiModel: VSegmentedPickerUIModel = .init(),
        selection: Binding<T>,
        headerTitle: String? = nil,
        footerTitle: String? = nil,
        disabledIndexes: Set<Int> = []
    )
        where
            Data == Array<T>,
            Content == Never,
            T: StringRepresentableHashableEnumeration
    {
        self.uiModel = uiModel
        self._selectedIndex = Binding(
            get: { Array(T.allCases).firstIndex(of: selection.wrappedValue)! }, // Force-unwrap
            set: { selection.wrappedValue = Array(T.allCases)[$0] }
        )
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.disabledIndexes = disabledIndexes
        self.content = .title(data:  Array(T.allCases), title: { $0.stringRepresentation })
    }
    
    // MARK: Body
    public var body: some View {
        VStack(alignment: .leading, spacing: uiModel.layout.headerPickerFooterSpacing, content: {
            header
            picker
            footer
        })
        .applyIf(uiModel.animations.appliesSelectionAnimation, transform: {
            $0
                .animation(uiModel.animations.selection, value: internalState)
                .animation(uiModel.animations.selection, value: selectedIndex)
        })
    }
    
    @ViewBuilder private var header: some View {
        if let headerTitle, !headerTitle.isEmpty {
            VText(
                type: uiModel.layout.headerTextLineType,
                color: uiModel.colors.header.value(for: internalState),
                font: uiModel.fonts.header,
                text: headerTitle
            )
            .padding(.horizontal, uiModel.layout.headerFooterMarginHorizontal)
        }
    }
    
    @ViewBuilder private var footer: some View {
        if let footerTitle, !footerTitle.isEmpty {
            VText(
                type: uiModel.layout.footerTextLineType,
                color: uiModel.colors.footer.value(for: internalState),
                font: uiModel.fonts.footer,
                text: footerTitle
            )
            .padding(.horizontal, uiModel.layout.headerFooterMarginHorizontal)
        }
    }
    
    private var picker: some View {
        ZStack(alignment: .leading, content: {
            pickerBackground
            indicator
            rows
            dividers
        })
        .frame(height: uiModel.layout.height)
        .cornerRadius(uiModel.layout.cornerRadius)
    }
    
    private var pickerBackground: some View {
        RoundedRectangle(cornerRadius: uiModel.layout.cornerRadius)
            .strokeBorder(uiModel.colors.border.value(for: internalState), lineWidth: uiModel.layout.borderWidth)
            .background(uiModel.colors.background.value(for: internalState))
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: uiModel.layout.indicatorCornerRadius)
            .padding(uiModel.layout.indicatorMargin)
            .frame(width: rowWidth)
            .scaleEffect(indicatorScale, anchor: indicatorScaleAnchor)
            .offset(x: rowWidth * CGFloat(selectedIndex))
            .foregroundColor(uiModel.colors.indicator.value(for: indicatorInternalState))
            .shadow(
                color: uiModel.colors.indicatorShadow.value(for: indicatorInternalState),
                radius: uiModel.colors.indicatorShadowRadius,
                offset: uiModel.colors.indicatorShadowOffset
            )
    }
    
    @ViewBuilder private var rows: some View {
        switch content {
        case .title(let data, let title):
            HStack(spacing: 0, content: {
                ForEach(data.indices, id: \.self, content: { i in
                    SwiftUIGestureBaseButton(
                        onStateChange: { stateChangeHandler(i: i, gestureState: $0) },
                        label: {
                            VText(
                                minimumScaleFactor: uiModel.layout.rowTitleMinimumScaleFactor,
                                color: uiModel.colors.rowTitle.value(for: rowInternalState(i: i)),
                                font: uiModel.fonts.rows,
                                text: title(data[i])
                            )
                            .padding(uiModel.layout.indicatorMargin)
                            .padding(uiModel.layout.contentMargin)
                            .frame(maxWidth: .infinity)
                            .scaleEffect(rowContentScale, anchor: rowContentScaleAnchor(i: i))
                            
                            .onSizeChange(perform: { rowWidth = $0.width })
                        }
                    )
                    .disabled(disabledIndexes.contains(i))
                })
            })
            
        case .content(let data, let content):
            HStack(spacing: 0, content: {
                ForEach(data.indices, id: \.self, content: { i in
                    SwiftUIGestureBaseButton(
                        onStateChange: { stateChangeHandler(i: i, gestureState: $0) },
                        label: {
                            content(rowInternalState(i: i), data[i])
                                .padding(uiModel.layout.indicatorMargin)
                                .padding(uiModel.layout.contentMargin)
                                .frame(maxWidth: .infinity)
                                .scaleEffect(rowContentScale, anchor: rowContentScaleAnchor(i: i))
                            
                                .onSizeChange(perform: { rowWidth = $0.width })
                        }
                    )
                    .disabled(disabledIndexes.contains(i))
                })
            })
        }
    }
    
    private var dividers: some View {
        HStack(spacing: 0, content: {
            ForEach(0..<content.count, id: \.self, content: { i in
                Spacer()
                
                if i <= content.count-2 {
                    Rectangle()
                        .frame(size: uiModel.layout.dividerSize)
                        .foregroundColor(uiModel.colors.divider.value(for: internalState))
                        .opacity(dividerOpacity(for: i))
                }
            })
        })
    }
    
    // MARK: Actions
    private func stateChangeHandler(i: Int, gestureState: GestureBaseButtonGestureState) {
        // Doesn't work as modifier
        // Not affected by animation flag
        withAnimation(uiModel.animations.indicatorPress, {
            pressedIndex = gestureState.isPressed ? i : nil
        })
        
        if gestureState.isClicked {
            playHapticEffect()
            selectedIndex = i
        }
    }
    
    // MARK: Haptics
    private func playHapticEffect() {
#if os(iOS)
        HapticManager.shared.playSelection()
#endif
    }
    
    // MARK: State Indication
    private var indicatorScale: CGFloat {
        switch selectedIndex {
        case pressedIndex: return uiModel.animations.indicatorPressedScale
        case _: return 1
        }
    }
    
    public var indicatorScaleAnchor: UnitPoint {
        switch selectedIndex {
        case 0: return .leading
        case content.count-1: return .trailing
        default: return .center
        }
    }
    
    public var rowContentScale: CGFloat {
        switch selectedIndex {
        case pressedIndex: return uiModel.animations.rowContentPressedScale
        case _: return 1
        }
    }
    
    public func rowContentScaleAnchor(i: Int) -> UnitPoint {
        guard i == selectedIndex else { return .center }
        return indicatorScaleAnchor
    }
    
    private func dividerOpacity(for index: Int) -> Double {
        let isBeforeIndicator: Bool = index < selectedIndex
        
        if isBeforeIndicator {
            return selectedIndex - index <= 1 ? 0 : 1
        } else {
            return index - selectedIndex < 1 ? 0 : 1
        }
    }
}

// MARK: - Preview
// Developmental only
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
struct VSegmentedPicker_Previews: PreviewProvider {
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
    private static var headerTitle: String { "Lorem ipsum dolor sit amet".pseudoRTL(languageDirection) }
    private static var footerTitle: String { "Lorem ipsum dolor sit amet, consectetur adipiscing elit".pseudoRTL(languageDirection) }
    
    private enum PickerRow: Int, StringRepresentableHashableEnumeration {
        case red, green, blue
        
        var stringRepresentation: String { _stringRepresentation.pseudoRTL(languageDirection) }
        private var _stringRepresentation: String {
            switch self {
            case .red: return "Red"
            case .green: return "Green"
            case .blue: return "Blue"
            }
        }
    }
    private static var selection: PickerRow { .red }
    
    // Previews (Scenes)
    private struct Preview: View {
        @State private var selection: PickerRow = VSegmentedPicker_Previews.selection
        
        var body: some View {
            PreviewContainer(content: {
                VSegmentedPicker(
                    selection: $selection,
                    headerTitle: headerTitle,
                    footerTitle: footerTitle
                )
                .padding()
            })
        }
    }
    
    private struct StatesPreview: View {
        var body: some View {
            PreviewContainer(
                embeddedInScrollViewOnPlatforms: [.macOS],
                content: {
                    PreviewRow(
                        axis: .vertical,
                        title: "Enabled",
                        content: {
                            VSegmentedPicker(
                                selection: .constant(selection),
                                headerTitle: headerTitle,
                                footerTitle: footerTitle
                            )
                        }
                    )
                    
                    // Color is also applied to other rows.
                    // Scale effect cannot be shown.
                    PreviewRow(
                        axis: .vertical,
                        title: "Pressed (Row)",
                        content: {
                            VSegmentedPicker(
                                uiModel: {
                                    var uiModel: VSegmentedPickerUIModel = .init()
                                    uiModel.colors.rowTitle.selected = uiModel.colors.rowTitle.pressedSelected
                                    return uiModel
                                }(),
                                selection: .constant(selection),
                                headerTitle: headerTitle,
                                footerTitle: footerTitle
                            )
                        }
                    )
                    
                    PreviewRow(
                        axis: .vertical,
                        title: "Disabled",
                        content: {
                            VSegmentedPicker(
                                selection: .constant(selection),
                                headerTitle: headerTitle,
                                footerTitle: footerTitle
                            )
                            .disabled(true)
                        }
                    )
                    
                    PreviewSectionHeader("Native")
                    
                    PreviewRow(
                        axis: .vertical,
                        title: "Enabled",
                        content: {
                            Picker("", selection: .constant(selection), content: {
                                ForEach(PickerRow.allCases.enumeratedArray(), id: \.element, content: { (i, row) in
                                    Text(row.stringRepresentation)
                                        .tag(i)
                                })
                            })
                            .labelsHidden()
                            .pickerStyle(.segmented)
                        }
                    )
                    
                    PreviewRow(
                        axis: .vertical,
                        title: "Disabled",
                        content: {
                            Picker("", selection: .constant(selection), content: {
                                ForEach(PickerRow.allCases.enumeratedArray(), id: \.element, content: { (i, row) in
                                    Text(row.stringRepresentation)
                                        .tag(i)
                                })
                            })
                            .labelsHidden()
                            .pickerStyle(.segmented)
                            .disabled(true)
                        }
                    )
                }
            )
        }
    }
}
