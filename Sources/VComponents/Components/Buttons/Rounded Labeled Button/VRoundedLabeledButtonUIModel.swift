//
//  VRoundedLabeledButtonUIModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 17.08.22.
//

import SwiftUI
import VCore

// MARK: - V Rounded Labeled Button UI Model
/// Model that describes UI.
public struct VRoundedLabeledButtonUIModel {
    // MARK: Properties
    fileprivate static let primaryButtonReference: VPrimaryButtonUIModel = .init()
    fileprivate static let roundedButtonReference: VRoundedButtonUIModel = .init()
    
    /// Model that contains layout properties.
    public var layout: Layout = .init()
    
    /// Model that contains color properties.
    public var colors: Colors = .init()
    
    /// Model that contains font properties.
    public var fonts: Fonts = .init()
    
    // MARK: Initializers
    /// Initializes UI model with default values.
    public init() {}

    // MARK: Layout
    /// Model that contains layout properties.
    public struct Layout {
        // MARK: Properties
        /// Rectangle dimension. Defaults to `56`.
        public var roundedRectangleDimension: CGFloat = roundedButtonReference.layout.dimension
        
        /// Rectangle corner radius. Defaults to `25`.
        public var cornerRadius: CGFloat = 25
        
        /// Rectangle border width. Defaults to `0`.
        ///
        /// To hide border, set to `0`.
        public var borderWidth: CGFloat = roundedButtonReference.layout.borderWidth
        
        /// Icon margins. Defaults to `3`s.
        public var iconMargins: LabelMargins = roundedButtonReference.layout.labelMargins
        
        /// Icon size. Defaults to `24` by `24`.
        public var iconSize: CGSize = .init(dimension: 24)
        
        /// Spacing between rounded rectangle and label. Defaults to `4`.
        public var rectangleLabelSpacing: CGFloat = 4
        
        /// Maximum label width. Defaults to `100`.
        public var labelWidthMax: CGFloat = 100
        
        /// Spacing between icon label and icon title. Defaults to `7`.
        public var labelSpacing: CGFloat = 7
        
        /// Icon label size. Defaults to `18` by `18`.
        public var iconLabelSize: CGSize = .init(dimension: 18)
        
        /// Title label line type. Defaults to `multiline` of `1...2` lines.
        public var titleLabelLineType: TextLineType = .multiLine(alignment: .leading, lineLimit: 1...2)
        
        /// Title label minimum scale factor. Defaults to `0.75`.
        public var titleLabelMinimumScaleFactor: CGFloat = primaryButtonReference.layout.titleMinimumScaleFactor
        
        // MARK: Initializers
        /// Initializes model with default values.
        public init() {}
        
        // MARK: Label Margins
        /// Model that contains `horizontal` and `vertical` margins.
        public typealias LabelMargins = EdgeInsets_HorizontalVertical
        
        // MARK: Hit Box
        /// Model that contains `horizontal` and `vertical` hit boxes.
        public typealias HitBox = EdgeInsets_HorizontalVertical
    }

    // MARK: Colors
    /// Model that contains color properties.
    public struct Colors {
        // MARK: Properties
        /// Background colors.
        public var background: StateColors = .init(
            enabled: roundedButtonReference.colors.background.enabled.opacity(0.25),
            pressed: roundedButtonReference.colors.background.pressed.opacity(0.25),
            disabled: roundedButtonReference.colors.background.disabled.opacity(0.25)
        )
        
        /// Border colors.
        public var border: StateColors = roundedButtonReference.colors.border
        
        /// Icon colors.
        ///
        /// Applied to all images. But should be used for vector images.
        /// In order to use bitmap images, set this to `clear`.
        public var icon: StateColors = .init(primaryButtonReference.colors.background)
        
        /// Icon opacities. Defaults to `1`s.
        ///
        /// Applied to all images. But should be used for bitmap images.
        /// In order to use vector images, set this to `1`s.
        public var iconOpacities: StateOpacities = roundedButtonReference.colors.iconOpacities
        
        /// Title label colors.
        public var titleLabel: StateColors = .init(
            enabled: ColorBook.primary,
            pressed: ColorBook.primaryPressedDisabled,
            disabled: ColorBook.primaryPressedDisabled
        )
        
        /// Icon label colors.
        ///
        /// Applied to all images. But should be used for vector images.
        /// In order to use bitmap images, set this to `clear`.
        public var iconLabel: StateColors = .init(
            enabled: ColorBook.primary,
            pressed: ColorBook.primaryPressedDisabled,
            disabled: ColorBook.primaryPressedDisabled
        )
        
        /// Icon label opacities. Defaults to `1`s.
        ///
        /// Applied to all images. But should be used for bitmap images.
        /// In order to use vector images, set this to `1`s.
        public var iconLabelOpacities: StateOpacities = roundedButtonReference.colors.iconOpacities
        
        /// Custom label opacities.
        ///
        /// Applicable only when `init` with label is used.
        /// When using a custom label, it's subviews cannot be configured with individual colors,
        /// so instead, a general opacity is being applied.
        public var customLabelOpacities: StateOpacities = roundedButtonReference.colors.customLabelOpacities
        
        // MARK: Initializers
        /// Initializes model with default values.
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
        /// Title font. Defaults to system font of size `15.
        ///
        /// Only applicable when using `init` with title.
        public var titleLabel: Font = .system(size: 15)
        
        // MARK: Initializers
        /// Initializes model with default values.
        public init() {}
    }
}
