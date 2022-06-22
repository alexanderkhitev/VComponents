//
//  VListUIModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 1/10/21.
//

import SwiftUI
import VCore

// MARK: - V Base List UI Model
/// Model that describes UI.
public struct VListUIModel {
    // MARK: Properties
    /// Sub-model containing layout properties.
    public var layout: Layout = .init()
    
    /// Sub-model containing color properties.
    public var colors: Colors = .init()
    
    // MARK: Initializers
    /// Initializes UI model with default values.
    public init() {}

    // MARK: Layout
    /// Sub-model containing layout properties.
    public struct Layout {
        // MARK: Properties
        /// Trailing margin. Defaults to `0`.
        ///
        /// Purpose of this property is to create a spacing between rows and scrolling indicator.
        public var marginTrailing: CGFloat = 0
        
        /// Spacing between rows. Defaults to `18`.
        public var rowSpacing: CGFloat = 18
        
        /// Row divider height. Defaults to `1/3`.
        public var dividerHeight: CGFloat = 1/3
        
        /// Divider margins. Defaults to `zero`.
        public var dividerMargins: HorizontalMargins = .zero
        
        var dividerMarginVertical: CGFloat { rowSpacing / 2 }
        
        /// Indicates if last row has divider. Defaults to `false`.
        public var lastRowHasDivider: Bool = false
        
        /// Indicates if scroll view has scroll indicator. Defaults to `true`.
        public var showsIndicator: Bool = true
        
        // MARK: Initializers
        /// Initializes sub-model with default values.
        public init() {}
        
        // MARK: Horizontal Margins
        /// Sub-model containing `leading` and `trailing` margins.
        public typealias HorizontalMargins = EdgeInsets_LT
    }
    
    // MARK: Colors
    /// Sub-model containing color properties.
    public struct Colors {
        // MARK: Properties
        /// Divider color.
        public var divider: Color = .init(componentAsset: "List.Divider")
        
        // MARK: Initializers
        /// Initializes sub-model with default values.
        public init() {}
    }

    // MARK: Sub-Models
    var lazyScrollViewSubUIModel: VLazyScrollViewVerticalUIModel {
        var uiModel: VLazyScrollViewVerticalUIModel = .init()
        uiModel.layout.showsIndicator = layout.showsIndicator
        return uiModel
    }
}