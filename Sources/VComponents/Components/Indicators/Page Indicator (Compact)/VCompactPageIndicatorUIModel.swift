//
//  VCompactPageIndicatorUIModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 25.02.23.
//

import SwiftUI
import VCore

// MARK: - V Compact Page Indicator UI Model
/// Model that describes UI.
public struct VCompactPageIndicatorUIModel {
    // MARK: Properties
    fileprivate static let pageIndicatorReference: VPageIndicatorUIModel = .init()
    
    /// Model that contains layout properties.
    public var layout: Layout = .init()
    
    /// Model that contains color properties.
    public var colors: Colors = .init()
    
    /// Model that contains animation properties.
    public var animations: Animations = .init()
    
    // MARK: Initializers
    /// Initializes UI model with default values.
    public init() {}
    
    init(
        layout: Layout,
        colors: Colors,
        animations: Animations
    ) {
        self.layout = layout
        self.colors = colors
        self.animations = animations
    }
    
    // MARK: Layout
    /// Model that contains layout properties.
    public struct Layout {
        // MARK: Properties
        /// Direction. Defaults to `leftToRight`.
        public var direction: LayoutDirectionOmni = pageIndicatorReference.layout.direction
        
        /// Dot dimension on the main axis. Defaults to `10`.
        ///
        /// For horizontal layouts, this will be width, and for vertical, height.
        public var dotDimensionPrimaryAxis: CGFloat = pageIndicatorReference.layout.dotDimensionPrimaryAxis ?? 10
        
        /// Dot dimension on the main axis when switching to `standard` configuration. Defaults to `10`.
        ///
        /// For horizontal layouts, this will be width, and for vertical, height.
        ///
        /// Set to `nil`, to make dot stretch to take available space.
        public var dotDimensionPrimaryAxisForStandardConfiguration: CGFloat? = pageIndicatorReference.layout.dotDimensionPrimaryAxis
        
        /// Dot dimension on the secondary axis. Defaults to `10`.
        ///
        /// For horizontal layouts, this will be height, and for vertical, width.
        public var dotDimensionSecondaryAxis: CGFloat = pageIndicatorReference.layout.dotDimensionSecondaryAxis
        
        /// Dot spacing. Defaults to `5`.
        public var spacing: CGFloat = pageIndicatorReference.layout.spacing
        
        /// Number of visible dots. Default to `7`.
        ///
        /// Must be odd and greater than `centerDots`, otherwise a `fatalError` will occur.
        public var visibleDots: Int = 7
        
        /// Number of center dots. Default to `7`.
        ///
        /// Must be odd and less than `visibleDots`, otherwise a `fatalError` will occur.
        public var centerDots: Int = 3
        
        var sideDots: Int { (visibleDots - centerDots) / 2 }
        
        var middleDots: Int { visibleDots / 2 }

        /// Scale of dot at the edge. Defaults to `0.5`.
        ///
        /// If there are `7` visible dots, and `3` center dots, scales would sit at `[0.5, 0.75, 1, 1, 1, 0.75, 0.5]`.
        public var edgeDotScale: CGFloat = 0.5
        
        /// Unselected dot scale when switching to `standard` configuration. Defaults to `0.85`.
        public var unselectedDotScaleForStandardConfiguration: CGFloat = pageIndicatorReference.layout.unselectedDotScale
        
        // MARK: Initializers
        /// Initializes UI model with default values.
        public init() {}
        
        init(
            direction: LayoutDirectionOmni,
            dotDimensionPrimaryAxis: CGFloat,
            dotDimensionPrimaryAxisForStandardConfiguration: CGFloat?,
            dotDimensionSecondaryAxis: CGFloat,
            spacing: CGFloat,
            visibleDots: Int,
            centerDots: Int,
            edgeDotScale: CGFloat,
            unselectedDotScaleForStandardConfiguration: CGFloat
        ) {
            self.direction = direction
            self.dotDimensionPrimaryAxis = dotDimensionPrimaryAxis
            self.dotDimensionPrimaryAxisForStandardConfiguration = dotDimensionPrimaryAxisForStandardConfiguration
            self.dotDimensionSecondaryAxis = dotDimensionSecondaryAxis
            self.spacing = spacing
            self.visibleDots = visibleDots
            self.centerDots = centerDots
            self.edgeDotScale = edgeDotScale
            self.unselectedDotScaleForStandardConfiguration = unselectedDotScaleForStandardConfiguration
        }
    }
    
    // MARK: Colors
    /// Model that contains color properties.
    public typealias Colors = VPageIndicatorUIModel.Colors

    // MARK: Animations
    /// Model that contains animation properties.
    public typealias Animations = VPageIndicatorUIModel.Animations
    
    // MARK: Sub UI Models
    var standardPageIndicatorSubUIModel: VPageIndicatorUIModel {
        .init(
            layout: .init(
                direction: layout.direction,
                dotDimensionPrimaryAxis: layout.dotDimensionPrimaryAxisForStandardConfiguration,
                dotDimensionSecondaryAxis: layout.dotDimensionSecondaryAxis,
                spacing: layout.spacing,
                unselectedDotScale: layout.unselectedDotScaleForStandardConfiguration
            ),
            colors: colors,
            animations: animations
        )
    }
}

// MARK: - Factory
extension VCompactPageIndicatorUIModel {
    /// `VCompactPageIndicatorUIModel` with vertical layout.
    public static var vertical: Self {
        var uiModel: Self = .init()
        
        uiModel.layout.direction = .topToBottom
        
        return uiModel
    }
}