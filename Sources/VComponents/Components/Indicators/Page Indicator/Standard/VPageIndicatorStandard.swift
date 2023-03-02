//
//  VPageIndicatorStandard.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 2/6/21.
//

import SwiftUI
import VCore

// MARK: - V Page Indicator Standard
struct VPageIndicatorStandard<Content>: View where Content: View {
    // MARK: Properties
    private let uiModel: VPageIndicatorStandardUIModel
    
    private let total: Int
    private let selectedIndex: Int
    
    private let dotContent: VPageIndicatorDotContent<Content>

    // MARK: Initializers
    init(
        uiModel: VPageIndicatorStandardUIModel,
        total: Int,
        selectedIndex: Int,
        dotContent: VPageIndicatorDotContent<Content>
    ) {
        self.uiModel = uiModel
        self.total = total
        self.selectedIndex = selectedIndex
        self.dotContent = dotContent
    }

    // MARK: Body
    var body: some View {
        let layout: AnyLayout = uiModel.layout.direction.stackLayout(spacing: uiModel.layout.spacing)
        
        let range: [Int] = (0..<total)
            .reversedArray(if: uiModel.layout.direction.isReversed)
        
        return layout.callAsFunction({
            ForEach(range, id: \.self, content: { i in
                dotContentView
                    .frame(width: uiModel.layout.direction.isHorizontal ? uiModel.layout.dotDimensionPrimaryAxis : uiModel.layout.dotDimensionSecondaryAxis)
                    .frame(height: uiModel.layout.direction.isHorizontal ? uiModel.layout.dotDimensionSecondaryAxis : uiModel.layout.dotDimensionPrimaryAxis)
                    .scaleEffect(selectedIndex == i ? 1 : uiModel.layout.unselectedDotScale)
                    .foregroundColor(selectedIndex == i ? uiModel.colors.selectedDot : uiModel.colors.dot)
            })
        })
            .animation(uiModel.animations.transition, value: selectedIndex)
    }
    
    @ViewBuilder private var dotContentView: some View {
        switch dotContent {
        case .default:
            Circle()
        
        case .custom(let content):
            content()
        }
    }
}

// MARK: - Preview
struct VPageIndicatorStandard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20, content: {
            ForEach(OmniLayoutDirection.allCases, id: \.self, content: { direction in
                VPageIndicatorStandard<Never>(
                    uiModel: {
                        var uiModel: VPageIndicatorStandardUIModel = .init()
                        uiModel.layout.direction = direction
                        return uiModel
                    }(),
                    total: 9,
                    selectedIndex: 4,
                    dotContent: .default
                )
            })
        })
    }
}