//
//  VLazyListModelVertical.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI

// MARK:- V Lazy List Model Vertical
public struct VLazyListModelVertical {
    public var layout: Layout = .init()
    public var showIndicator: Bool = true
    
    public init() {}
}

// MARK:- Layout
extension VLazyListModelVertical {
    public struct Layout {
        public var alignment: HorizontalAlignment = .center
        
        public init() {}
    }
}