//
//  VLoadingStretchedButtonUIModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/24/20.
//

import SwiftUI
import VCore

// MARK: - V Loading Stretched Button UI Model
/// Model that describes UI.
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct VLoadingStretchedButtonUIModel {
    // MARK: Properties
    /// Model that contains layout properties.
    public var layout: Layout = .init()
    
    /// Model that contains color properties.
    public var colors: Colors = .init()
    
    /// Model that contains font properties.
    public var fonts: Fonts = .init()
    
    /// Model that contains animation properties.
    public var animations: Animations = .init()
    
    /// Initializes UI model with default values.
    public init() {}
    
    // MARK: Layout
    /// Model that contains layout properties.
    public struct Layout {
        // MARK: Properties
        /// Button height.
        /// Set to `48` on `iOS`.
        /// Set to `40` on `macOS`.
        public var height: CGFloat = GlobalUIModel.Buttons.heightStretchedButton
        
        /// Corner radius.
        /// Set to `14` on `iOS`.
        /// Set to `12` on `macOS`.
        public var cornerRadius: CGFloat = GlobalUIModel.Buttons.cornerRadiusStretchedButton
        
        /// Border width. Set to `0`.
        ///
        /// To hide border, set to `0`.
        public var borderWidth: CGFloat = 0
        
        /// Label margins. Set to `15` horizontal and `3` vertical.
        public var labelMargins: LabelMargins = GlobalUIModel.Buttons.labelMargins
        
        /// Icon size.
        /// Set to `18x18` on `iOS`.
        /// Set to `16x16` on `macOS`.
        public var iconSize: CGSize = {
#if os(iOS)
            return CGSize(dimension: 18)
#elseif os(macOS)
            return CGSize(dimension: 16)
#else
            fatalError() // Not supported
#endif
        }()
        
        /// Title text minimum scale factor. Set to `0.75`.
        public var titleTextMinimumScaleFactor: CGFloat = GlobalUIModel.Common.minimumScaleFactor
        
        /// Spacing between icon and title text. Set to `8`.
        ///
        /// Applicable only if icon `init` with icon and title is used.
        public var iconAndTitleTextSpacing: CGFloat = GlobalUIModel.Buttons.iconAndTitleTextSpacing
        
        /// Model for customizing spinner layout.
        public var spinnerSubUIModel: VContinuousSpinnerUIModel.Layout = .init()
        
        /// Spacing between label and spinner. Set to `20`.
        ///
        /// Only visible when state is set to `loading`.
        public var labelAndSpinnerSpacing: CGFloat = 20
        
        // MARK: Initializers
        /// Initializes UI model with default values.
        public init() {}
        
        // MARK: Label Margins
        /// Model that contains `horizontal` and `vertical` margins.
        public typealias LabelMargins = EdgeInsets_HorizontalVertical
    }
    
    // MARK: Colors
    /// Model that contains color properties.
    public struct Colors {
        // MARK: Properties
        /// Background colors.
        public var background: StateColors = .init(
            enabled: ColorBook.controlLayerBlue,
            pressed: ColorBook.controlLayerBluePressed,
            loading: ColorBook.controlLayerBlueDisabled,
            disabled: ColorBook.controlLayerBlueDisabled
        )

        /// Shadow colors.
        public var shadow: StateColors = .clearColors

        /// Shadow radius. Set to `0`.
        public var shadowRadius: CGFloat = 0

        /// Shadow offset. Set to `zero`.
        public var shadowOffset: CGPoint = .zero
        
        /// Border colors.
        public var border: StateColors = .clearColors
        
        /// Title text colors.
        public var titleText: StateColors = .init(ColorBook.primaryWhite)
        
        /// Icon colors.
        ///
        /// Applied to all images. But should be used for vector images.
        /// In order to use bitmap images, set this to `clear`.
        public var icon: StateColors = .init(ColorBook.primaryWhite)
        
        /// Icon opacities. Set to `1`s.
        ///
        /// Applied to all images. But should be used for bitmap images.
        /// In order to use vector images, set this to `1`s.
        public var iconOpacities: StateOpacities = .init(1)
        
        /// Model for customizing spinner colors.
        public var spinnerSubUIModel: VContinuousSpinnerUIModel.Colors = {
            var uiModel: VContinuousSpinnerUIModel.Colors = .init()
            
            uiModel.spinner = ColorBook.primaryWhite
            
            return uiModel
        }()
        
        // MARK: Initializers
        /// Initializes UI model with default values.
        public init() {}
        
        // MARK: State Colors
        /// Model that contains colors for component states.
        public typealias StateColors = GenericStateModel_EnabledPressedLoadingDisabled<Color>
        
        // MARK: State Opacities
        /// Model that contains opacities for component states.
        public typealias StateOpacities = GenericStateModel_EnabledPressedLoadingDisabled<CGFloat>
    }
    
    // MARK: Fonts
    /// Model that contains font properties.
    public struct Fonts {
        // MARK: Properties
        /// Title text font.
        /// Set to `semibold` `callout` (`16`) on `iOS`.
        /// Set to `semibold` `16` on `macOS`.
        public var titleText: Font = GlobalUIModel.Buttons.titleTextFontStretchedButton
        
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
        public var backgroundPressedScale: CGFloat = GlobalUIModel.Buttons.pressedScale
        
        /// Ratio to which label scales down on press.
        /// Set to `1` on `iOS`.
        /// Set to `1` on `macOS`.
        /// Set to `0.98` on `watchOS`.
        public var labelPressedScale: CGFloat = GlobalUIModel.Buttons.pressedScale
        
        /// Model for customizing spinner animations.
        public var spinnerSubUIModel: VContinuousSpinnerUIModel.Animations = .init()
        
#if os(iOS)
        /// Haptic feedback style. Set to `medium`.
        public var haptic: UIImpactFeedbackGenerator.FeedbackStyle? = GlobalUIModel.Buttons.hapticStretchedButtonIOS
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
    
    var spinnerSubUIModel: VContinuousSpinnerUIModel {
        var uiModel: VContinuousSpinnerUIModel = .init()
        
        uiModel.layout = layout.spinnerSubUIModel
        
        uiModel.colors = colors.spinnerSubUIModel
        
        uiModel.animations = animations.spinnerSubUIModel
        
        return uiModel
    }
}
