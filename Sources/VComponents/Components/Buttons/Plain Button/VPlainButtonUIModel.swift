//
//  VPlainButtonUIModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI
import VCore

// MARK: - V Plain Button UI Model
/// Model that describes UI.
@available(tvOS, unavailable)
public struct VPlainButtonUIModel {
    // MARK: Properties
    /// Model that contains layout properties.
    public var layout: Layout = .init()
    
    /// Model that contains color properties.
    public var colors: Colors = .init()
    
    /// Model that contains font properties.
    public var fonts: Fonts = .init()
    
    /// Model that contains animation properties.
    public var animations: Animations = .init()
    
    // MARK: Initializers
    /// Initializes UI model with default values.
    public init() {}
    
    // MARK: Layout
    /// Model that contains layout properties.
    public struct Layout {
        // MARK: Properties
        /// Icon size. Set to `24x24`.
        ///
        /// This icon size is calibrated for `init` with icon.
        /// If you wish to use `init` with icon and title, scale it down a bit.
        public var iconSize: CGSize = .init(dimension: 24)
        
        /// Title text minimum scale factor. Set to `0.75`.
        public var titleTextMinimumScaleFactor: CGFloat = GlobalUIModel.Common.minimumScaleFactor
        
        /// Spacing between icon and title text. Set to `8`.
        ///
        /// Applicable only if icon `init` with icon and title is used.
        public var iconAndTitleTextSpacing: CGFloat = GlobalUIModel.Buttons.iconAndTitleTextSpacing
        
        /// Hit box. Set to `5`s.
        public var hitBox: HitBox = .init(5)
        
        // MARK: Initializers
        /// Initializes UI model with default values.
        public init() {}
        
        // MARK: Hit Box
        /// Model that contains `horizontal` and `vertical` hit boxes.
        public typealias HitBox = EdgeInsets_HorizontalVertical
    }
    
    // MARK: Colors
    /// Model that contains color properties.
    public struct Colors {
        // MARK: Properties
        /// Title text colors.
        public var titleText: StateColors = .init(
            enabled: ColorBook.accentBlue,
            pressed: ColorBook.accentBluePressedDisabled,
            disabled: ColorBook.accentBluePressedDisabled
        )
        
        /// Icon colors.
        ///
        /// Applied to all images. But should be used for vector images.
        /// In order to use bitmap images, set this to `clear`.
        public var icon: StateColors = .init(
            enabled: ColorBook.accentBlue,
            pressed: ColorBook.accentBluePressedDisabled,
            disabled: ColorBook.accentBluePressedDisabled
        )
        
        /// Icon opacities. Set to `1`s.
        ///
        /// Applied to all images. But should be used for bitmap images.
        /// In order to use vector images, set this to `1`s.
        public var iconOpacities: StateOpacities = .init(1)
        
        // MARK: Initializers
        /// Initializes UI model with default values.
        public init() {}
        
        // MARK: State Colors
        /// Model that contains colors for component states.
        public typealias StateColors = GenericStateModel_EnabledPressedDisabled<Color>
        
        // MARK: State Opacities
        /// Model that contains opacities for component states.
        public typealias StateOpacities = GenericStateModel_EnabledPressedDisabled<CGFloat>
    }
    
    // MARK: Fonts
    /// Model that contains font properties.
    public struct Fonts {
        // MARK: Properties
        /// Title text font.
        /// Set to `body` (`17`) on `iOS`.
        /// Set to `body` (`13`) on `macOS`.
        /// Set to `body` (`17`) on `watchOS`.
        public var titleText: Font = {
#if os(iOS)
            return Font.body
#elseif os(macOS)
            return Font.body
#elseif os(watchOS)
            return Font.body
#else
            fatalError() // Not supported
#endif
        }()
        
        // MARK: Initializers
        /// Initializes UI model with default values.
        public init() {}
    }
    
    // MARK: Animations
    /// Model that contains animation properties.
    public struct Animations {
        // MARK: Properties
        /// Indicates if button animates state change. Defaults to `true`.
        public var animatesStateChange: Bool = true
        
        /// Ratio to which label scales down on press.
        /// Set to `1` on `iOS`.
        /// Set to `1` on `macOS`.
        /// Set to `0.98` on `watchOS`.
        public var labelPressedScale: CGFloat = GlobalUIModel.Buttons.pressedScale
        
#if os(iOS)
        /// Haptic feedback style. Set to `nil`.
        public var haptic: UIImpactFeedbackGenerator.FeedbackStyle? = nil
#elseif os(watchOS)
        /// Haptic feedback type. Set to `nil`.
        public var haptic: WKHapticType? = nil
#endif
        
        // MARK: Initializers
        /// Initializes UI model with default values.
        public init() {}
    }
    
    // MARK: Sub UI Models
    var baseButtonSubUIModel: SwiftUIBaseButtonUIModel {
        var uiModel: SwiftUIBaseButtonUIModel = .init()
        
        uiModel.animations.animatesStateChange = animations.animatesStateChange
        
        return uiModel
    }
}
