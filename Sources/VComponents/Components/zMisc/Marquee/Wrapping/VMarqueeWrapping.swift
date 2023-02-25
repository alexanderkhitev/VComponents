//
//  VMarqueeWrapping.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 24.02.23.
//

import SwiftUI
import VCore

// MARK: - V Marquee Wrapping
struct VMarqueeWrapping<Content>: View where Content: View {
    // MARK: Properties
    private let uiModel: VMarqueeWrappingUIModel
    private let content: () -> Content
    
    @State private var containerWidth: CGFloat = 0
    @State private var contentSize: CGSize = .zero
    private var isDynamic: Bool { (contentSize.width + 2*uiModel.layout.inset) > containerWidth }
    
    @State private var isAnimating: Bool = Self.isAnimatingDefault
    private static var isAnimatingDefault: Bool { false }
    
    // MARK: Initializers
    init(
        uiModel: VMarqueeWrappingUIModel,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.uiModel = uiModel
        self.content = content
    }
    
    // MARK: Body
    var body: some View {
        Color.clear
            .frame(height: contentSize.height)
            .readSize(onChange: { containerWidth = $0.width })
            .overlay(content: { marqueeContentView })
            .overlay(content: { gradient })
            .clipped()
    }
    
    @ViewBuilder private var marqueeContentView: some View {
        if isDynamic {
            Group(content: {
                contentView
                    .offset(x: offsetDynamicFirst)
                    .animation(isAnimating ? animation : resettingAnimation, value: isAnimating)
                    .onAppear(perform: {
                        DispatchQueue.main.async(execute: { isAnimating = isDynamic })
                    })
                
                contentView
                    .offset(x: offsetDynamicSecond)
                    .animation(isAnimating ? animation : resettingAnimation, value: isAnimating)
                    .onAppear(perform: {
                        DispatchQueue.main.async(execute: { isAnimating = isDynamic })
                    })
            })
                .offset(x: offsetDynamic)
            
        } else {
            contentView
                .offset(x: offsetStatic)
                .onAppear(perform: { isAnimating = Self.isAnimatingDefault })
        }
    }
    
    private var contentView: some View {
        content()
            .fixedSize()
            .readSize(onChange: { contentSize = $0 })
    }
    
    @ViewBuilder private var gradient: some View {
        if isDynamic && uiModel.colors.gradientWidth > 0 {
            HStack(spacing: 0, content: {
                LinearGradient(
                    colors: [
                        uiModel.colors.gradientColorContainerEdge,
                        uiModel.colors.gradientColorContentEdge
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                    .frame(width: uiModel.colors.gradientWidth)
                
                Spacer()
                
                LinearGradient(
                    colors: [
                        uiModel.colors.gradientColorContentEdge,
                        uiModel.colors.gradientColorContainerEdge
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                    .frame(width: uiModel.colors.gradientWidth)
            })
        }
    }
    
    // MARK: Offsets
    private var offsetDynamic: CGFloat {
        let offset: CGFloat = (contentSize.width - containerWidth)/2 + uiModel.layout.inset
        
        switch uiModel.layout.direction {
        case .leftToRight: return offset
        case .rightToLeft: return -offset
        @unknown default: return offset
        }
    }
    
    private var offsetDynamicFirst: CGFloat {
        let offset: CGFloat = -(contentSize.width + uiModel.layout.inset + uiModel.layout.spacing/2)
        
        switch (uiModel.layout.direction, isAnimating) {
        case (.leftToRight, false): return 0
        case (.leftToRight, true): return offset
        case (.rightToLeft, false): return offset
        case (.rightToLeft, true): return 0
        @unknown default: return offset
        }
    }
    
    private var offsetDynamicSecond: CGFloat {
        let offset: CGFloat = contentSize.width + uiModel.layout.inset + uiModel.layout.spacing/2
        
        switch (uiModel.layout.direction, isAnimating) {
        case (.leftToRight, false): return offset
        case (.leftToRight, true): return 0
        case (.rightToLeft, false): return 0
        case (.rightToLeft, true): return offset
        @unknown default: return offset
        }
    }

    private var offsetStatic: CGFloat {
        let offset: CGFloat = (contentSize.width - containerWidth)/2 + uiModel.layout.inset
        
        switch uiModel.layout.alignmentStationary {
        case .leading: return offset
        case .center: return 0
        case .trailing: return -offset
        default: fatalError()
        }
    }
    
    // MARK: Animations
    private var animation: Animation {
        let width: CGFloat = // Not dependent on container width
            contentSize.width +
            uiModel.layout.inset +
            uiModel.layout.spacing/2
        
        return BasicAnimation(
            curve: uiModel.animations.curve,
            duration: uiModel.animations.durationType.duration(width: width)
        )
            .toSwiftUIAnimation
            .delay(uiModel.animations.delay)
            .repeatForever(autoreverses: false)
    }
    
    private let resettingAnimation: Animation = .linear(duration: 0)
}

// MARK: - Preview
struct VMarqueeWrapping_Previews: PreviewProvider {
    private static var shortText: String { "Lorem ipsum" }
    private static var longText: String { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tempus facilisis risus, ut condimentum diam tempus non." }
    
    static var previews: some View {
        VStack(spacing: 10, content: {
            VMarqueeWrapping(uiModel: .insettedGradient, content: {
                Text(shortText)
            })
            
            VMarqueeWrapping(uiModel: .insettedGradient, content: {
                HStack(content: {
                    Image(systemName: "swift")
                    Text(longText)
                })
                    .drawingGroup()
            })
        })
    }
}
