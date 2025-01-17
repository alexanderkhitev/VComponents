//
//  VBouncingMarqueeUIModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 24.02.23.
//

import SwiftUI
import VCore

// MARK: - V Bouncing Marquee UI Model
/// Model that describes UI.
public struct VBouncingMarqueeUIModel {
    // MARK: Properties
    /// Model that contains layout properties.
    public var layout: Layout = .init()
    
    /// Model that contains color properties.
    public var colors: Colors = .init()
    
    /// Model that contains animation properties.
    public var animations: Animations = .init()
    
    // MARK: Initializers
    /// Initializes UI model with default values.
    public init() {}
    
    // MARK: Layout
    /// Model that contains layout properties.
    public struct Layout {
        // MARK: Properties
        /// Scroll direction. Set to `leftToRight`.
        public var scrollDirection: LayoutDirection = .leftToRight
        
        /// Content inset. Set to `0`.
        ///
        /// Ideal for text content.
        /// Alternately, use `insettedGradient` instance of `VBouncingMarqueeUIModel`.
        ///
        /// For best result, should be greater than or equal to `gradientWidth`.
        public var inset: CGFloat = 0
        
        /// Horizontal alignment for non-scrolling stationary content. Set to `leading`.
        public var alignmentStationary: HorizontalAlignment = .leading
        
        // MARK: Initializers
        /// Initializes UI model with default values.
        public init() {}
    }
    
    // MARK: Colors
    /// Model that contains color properties.
    public typealias Colors = VWrappingMarqueeUIModel.Colors
    
    // MARK: Animations
    /// Model that contains animation properties.
    public typealias Animations = VWrappingMarqueeUIModel.Animations
}

// MARK: - Factory
extension VBouncingMarqueeUIModel {
    /// `VBouncingMarqueeUIModel` that insets content and applies fading gradient.
    ///
    /// Ideal for text content.
    public static var insettedGradient: Self {
        var uiModel: Self = .init()
        
        uiModel.layout.inset = 20
        
        uiModel.colors.gradientWidth = 20
        
        return uiModel
    }
}
