//
//  VBottomSheetUIModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 1/21/21.
//

import SwiftUI
import VCore

// MARK: - V Bottom Sheet UI Model
/// Model that describes UI.
public struct VBottomSheetUIModel {
    // MARK: Properties
    fileprivate static let sheetReference: VSheetUIModel = .init()
    fileprivate static let modalReference: VModalUIModel = .init()
    
    /// Model that contains layout properties.
    public var layout: Layout = .init()
    
    /// Model that contains color properties.
    public var colors: Colors = .init()
    
    /// Model that contains font properties.
    public var fonts: Fonts = .init()
    
    /// Model that contains animation properties.
    public var animations: Animations = .init()
    
    /// Model that contains misc properties.
    public var misc: Misc = .init()
    
    // MARK: Initializers
    /// Initializes UI model with default values.
    public init() {}

    // MARK: Layout
    /// Model that contains layout properties.
    public struct Layout {
        // MARK: Properties
        /// Bottom sheet sizes.
        /// Set to `1` ratio of screen width, and `0.6`, `0.6`, and `0.9` ratios of screen height in portrait.
        /// Set to `0.7` ratio of screen width and `0.9` ratio of screen height in landscape.
        public var sizes: Sizes = .init(
            portrait: .fraction(.init(
                width: 1,
                heights: .init(min: 0.6, ideal: 0.6, max: 0.9)
            )),
            landscape: .fraction(.init(
                width: 0.7,
                heights: .fixed(0.9)
            ))
        )
        
        /// Corner radius. Defaults to `15`.
        public var cornerRadius: CGFloat = modalReference.layout.cornerRadius
        
        /// Grabber indicator size. Defaults to `50` width and `4` height.
        ///
        /// To hide, set to `zero`.
        public var grabberSize: CGSize = .init(width: 50, height: 4)
        
        /// Grabber corner radius. Defaults to `2`.
        public var grabberCornerRadius: CGFloat = 2
        
        /// Grabber margins. Defaults to `10` top  and `0` bottom.
        public var grabberMargins: VerticalMargins = .init(
            top: 10,
            bottom: 0
        )
        
        /// Header alignment. Defaults to `center`.
        public var headerAlignment: VerticalAlignment = modalReference.layout.headerAlignment
        
        /// Header margins. Defaults to `15` horizontal, `10` vertical.
        public var headerMargins: Margins = modalReference.layout.headerMargins
        
        /// Model for customizing close button layout. `dimension` defaults to `30`, `iconSize` defaults to `12` by `12`, and `hitBox` defaults to `zero`.
        ///
        /// Not all properties will have an effect, and setting them may be futile.
        public var closeButtonSubUIModel: VRoundedButtonUIModel.Layout = modalReference.layout.closeButtonSubUIModel
        
        /// Spacing between label and close button. Defaults to `10`.
        public var labelCloseButtonSpacing: CGFloat = modalReference.layout.labelCloseButtonSpacing
        
        /// Divider height. Defaults to `0.67`.
        ///
        /// To hide divider, set to `0`, and remove header.
        public var dividerHeight: CGFloat = modalReference.layout.dividerHeight
    
        /// Divider margins. Defaults to `.zero`.
        public var dividerMargins: Margins = modalReference.layout.dividerMargins
        
        /// Content margins. Defaults to `zero`.
        public var contentMargins: Margins = modalReference.layout.contentMargins
        
        /// Indicates if sheet resizes content based on its visible frame. Defaults to `false`.
        ///
        /// Can be used for scrollable content.
        /// Optionally, add `bottom` to `contentSafeAreaEdges` to ensure that scrollable content always has bottom safe area inset.
        ///
        /// Has no effect on fixed bottom sheet.
        public var autoresizesContent: Bool = false
        
        /// Edges on which header has safe area edges. Defaults to `[]`.
        ///
        /// Can be used for full-sized modal, to prevent header from leaving safe area.
        public var headerSafeAreaEdges: Edge.Set = []
        
        /// Edges on which content has safe area edges. Defaults to `[]`.
        ///
        /// `autoresizesContent` must be set to `true` for scrollable content to always have bottom safe area inset.
        public var contentSafeAreaEdges: Edge.Set = []
        
        /// Edges ignored by keyboard. Defaults to `[]`.
        public var ignoredKeyboardSafeAreaEdges: Edge.Set = []
        
        /// Velocity at which sheet snaps to next height, regardless of sufficient distance traveled. Defaults to `600` points/s.
        public var velocityToSnapToNextHeight: CGFloat = 600
        
        /// Ratio of distance to drag sheet downwards to initiate dismiss relative to min height. Defaults to `0.1`.
        public var pullDownDismissDistanceMinHeightRatio: CGFloat = 0.1
        
        var pullDownDismissDistance: CGFloat { pullDownDismissDistanceMinHeightRatio * sizes._current.size.heights.min }
        
        // MARK: Initializers
        /// Initializes model with default values.
        public init() {}
        
        // MARK: Sizes
        /// Model that represents modal sizes.
        public typealias Sizes = ModalSizes<BottomSheetSize>
        
        // MARK: Bottom Sheet Size
        /// Bottom sheet size.
        public struct BottomSheetSize: Equatable {
            // MARK: Properties
            /// Width.
            public var width: CGFloat
            
            /// Heights.
            public var heights: BottomSheetHeights
            
            // MARK: Initializers
            /// Initializes `BottomSheetSize`.
            public init(
                width: CGFloat,
                heights: BottomSheetHeights
            ) {
                self.width = width
                self.heights = heights
            }
        }
        
        // MARK: Bottom Sheet Heights
        /// Bottom Sheet Heights
        public struct BottomSheetHeights: Equatable {
            // MARK: Properties
            /// Minimum height.
            public var min: CGFloat
            
            /// Ideal height.
            public var ideal: CGFloat
            
            /// Maximum height.
            public var max: CGFloat
            
            /// Indicates if model allows resizing.
            public var isResizable: Bool {
                min != ideal ||
                ideal != max
            }
            
            var minOffset: CGFloat {
                if isResizable {
                    return UIScreen.main.bounds.height - min
                } else {
                    return (UIScreen.main.bounds.height - min) / 2
                }
            }
            
            var idealOffset: CGFloat {
                if isResizable {
                    return UIScreen.main.bounds.height - ideal
                } else {
                    return (UIScreen.main.bounds.height - ideal) / 2
                }
            }
            
            var maxOffset: CGFloat {
                if isResizable {
                    return UIScreen.main.bounds.height - max
                } else {
                    return (UIScreen.main.bounds.height - max) / 2
                }
            }
            
            var hiddenOffset: CGFloat {
                if isResizable {
                    return UIScreen.main.bounds.height
                } else {
                    return UIScreen.main.bounds.height - maxOffset
                }
            }
            
            // MARK: Initializers
            /// Initializes `Height`.
            public init(min: CGFloat, ideal: CGFloat, max: CGFloat) {
                assert(min <= ideal, "`VBottomSheet`'s `min` height must be less than or equal to `ideal` height")
                assert(ideal <= max, "`VBottomSheet`'s `ideal` height must be less than or equal to `max` height")
                
                self.min = min
                self.ideal = ideal
                self.max = max
            }
            
            /// Initializes `Height` with fixed values.
            public static func fixed(_ value: CGFloat) -> Self {
                .init(
                    min: value,
                    ideal: value,
                    max: value
                )
            }
        }
        
        // MARK: Margins
        /// Model that contains `leading`, `trailing`, `top`, and `bottom` margins.
        public typealias Margins = EdgeInsets_LeadingTrailingTopBottom
        
        // MARK: Vertical Margins
        /// Model that contains `top` and `bottom` margins.
        public typealias VerticalMargins = EdgeInsets_TopBottom
    }

    // MARK: Colors
    /// Model that contains color properties.
    public struct Colors {
        // MARK: Properties
        /// Background color.
        public var background: Color = modalReference.colors.background
        
        /// Shadow color.
        public var shadow: Color = modalReference.colors.shadow
        
        /// Shadow radius. Defaults to `0`.
        public var shadowRadius: CGFloat = modalReference.colors.shadowRadius
        
        /// Shadow offset. Defaults to `zero`.
        public var shadowOffset: CGSize = modalReference.colors.shadowOffset
        
        /// Dimming view color.
        public var dimmingView: Color = modalReference.colors.dimmingView
        
        /// Grabber color.
        public var grabber: Color = .init(componentAsset: "BottomSheet.Grabber")
        
        /// Header title color.
        ///
        /// Only applicable when using `init` with title.
        public var headerTitle: Color = modalReference.colors.headerTitle
        
        /// Model for customizing close button colors.
        ///
        /// Not all properties will have an effect, and setting them may be futile.
        public var closeButtonSubUIModel: VRoundedButtonUIModel.Colors = modalReference.colors.closeButtonSubUIModel
        
        /// Divider color.
        public var divider: Color = modalReference.colors.divider
        
        // MARK: Initializers
        /// Initializes model with default values.
        public init() {}
        
        // MARK: State Colors
        /// Model that contains colors for component states.
        public typealias StateColors = GenericStateModel_EnabledPressedDisabled<Color>
    }

    // MARK: Fonts
    /// Model that contains font properties.
    public struct Fonts {
        // MARK: Properties
        /// Header font.
        ///
        /// Only applicable when using `init` with title.
        public var header: Font = modalReference.fonts.header
        
        // MARK: Initializers
        /// Initializes model with default values.
        public init() {}
    }

    // MARK: Animations
    /// Model that contains animation properties.
    public struct Animations {
        // MARK: Properties
        /// Appear animation. Defaults to `easeInOut` with duration `0.3`.
        public var appear: BasicAnimation? = .init(curve: .easeInOut, duration: 0.3)
        
        /// Disappear animation. Defaults to `easeInOut` with duration `0.3`.
        public var disappear: BasicAnimation? = .init(curve: .easeInOut, duration: 0.3)
        
        /// Pull-down dismiss animation. Defaults to `easeInOut` with duration `0.1`.
        public var pullDownDismiss: BasicAnimation? = .init(curve: .easeInOut, duration: 0.1)
        
        /// Height snapping animation between `min`, `ideal`, and `max` states. Defaults to `interpolatingSpring`, with mass `1`, stiffness `300`, damping `30`, and initialVelocity `1`.
        public var heightSnap: Animation = .interpolatingSpring(mass: 1, stiffness: 300, damping: 30, initialVelocity: 1)
        
        // MARK: Initializers
        /// Initializes model with default values.
        public init() {}
    }

    // MARK: Misc
    /// Model that contains misc properties.
    public struct Misc {
        // MARK: Properties
        /// Method of dismissing modal. Defaults to `default`.
        public var dismissType: DismissType = .default
        
        /// Indicates if bottom sheet can be resized by dragging outside the header. Defaults to `false`.
        ///
        /// Setting to `true` may cause issues with scrollable views.
        ///
        /// Has no effect on fixed bottom sheet.
        public var contentIsDraggable: Bool = false
        
        // MARK: Initializers
        /// Initializes model with default values.
        public init() {}
        
        // MARK: Dismiss Type
        /// Dismiss type, such as `leadingButton`, `trailingButton`, `backTap`, or `pullDown`.
        public struct DismissType: OptionSet {
            // MARK: Properties
            public let rawValue: Int
            
            /// Leading.
            public static var leadingButton: DismissType { .init(rawValue: 1 << 0) }
            
            /// Trailing.
            public static var trailingButton: DismissType { .init(rawValue: 1 << 1) }
            
            /// Back-tap.
            public static var backTap: DismissType { .init(rawValue: 1 << 2) }
            
            /// Pull down.
            public static var pullDown: DismissType { .init(rawValue: 1 << 3) }
            
            /// All.
            public static var all: DismissType { [.leadingButton, .trailingButton, .backTap, .pullDown] }
            
            /// Default value. Set to `trailingButton` and `.pullDown`.
            public static var `default`: DismissType { [.trailingButton, .pullDown] }
            
            /// Indicates if dismiss type inclues a button.
            public var hasButton: Bool {
                [.leadingButton, .trailingButton].contains(where: { contains($0) })
            }
            
            // MARK: Initializers
            public init(rawValue: Int) {
                self.rawValue = rawValue
            }
        }
    }
    
    // MARK: Sub UI Models
    var sheetSubUIModel: VSheetUIModel {
        var uiModel: VSheetUIModel = .init()
        
        uiModel.layout.roundedCorners = .topCorners
        uiModel.layout.cornerRadius = layout.cornerRadius
        uiModel.layout.contentMargin = 0
        
        uiModel.colors.background = colors.background
        
        return uiModel
    }
    
    var closeButtonSubUIModel: VRoundedButtonUIModel {
        var uiModel: VRoundedButtonUIModel = .init()
        
        uiModel.layout = layout.closeButtonSubUIModel
        
        uiModel.colors = colors.closeButtonSubUIModel
        
        return uiModel
    }
}

// MARK: - Factory
extension VBottomSheetUIModel {
    /// `VBottomSheetUIModel` that insets content.
    public static var insettedContent: VBottomSheetUIModel {
        var uiModel: VBottomSheetUIModel = .init()
        
        uiModel.layout.contentMargins = .init(VSheetUIModel.Layout().contentMargin)
        
        return uiModel
    }
    
    /// `VBottomSheetUIModel` that autoresizes content and inserts bottom safe area for scrollable content.
    public static var scrollableContent: VBottomSheetUIModel {
        var uiModel: VBottomSheetUIModel = .init()
        
        uiModel.layout.autoresizesContent = true
        uiModel.layout.contentSafeAreaEdges.insert(.bottom)
        
        return uiModel
    }
    
    /// `VBottomSheetUIModel` that hides header.
    ///
    /// Grabber is still visible. To hide grabber, use `fullSizedContent`.
    public static var noHeaderLabel: VBottomSheetUIModel {
        var uiModel: VBottomSheetUIModel = .init()
        
        uiModel.misc.dismissType.remove(.leadingButton)
        uiModel.misc.dismissType.remove(.trailingButton)
        
        return uiModel
    }
    
    /// `VBottomSheetUIModel` that hides header, autoresizes content, and inserts bottom safe area for scrollable content.
    ///
    /// Grabber is still visible. To hide grabber, use `fullSizedContent`.
    public static var scrollableContentNoHeaderLabel: VBottomSheetUIModel {
        var uiModel: VBottomSheetUIModel = .init()
        
        uiModel.layout.autoresizesContent = true
        uiModel.layout.contentSafeAreaEdges.insert(.bottom)
        
        uiModel.misc.dismissType.remove(.leadingButton)
        uiModel.misc.dismissType.remove(.trailingButton)
        
        return uiModel
    }
    
    /// `VBottomSheetUIModel` that stretches content to full size.
    public static var fullSizedContent: VBottomSheetUIModel {
        var uiModel: VBottomSheetUIModel = .noHeaderLabel
        
        uiModel.layout.grabberSize.height = .zero
        
        return uiModel
    }
}
