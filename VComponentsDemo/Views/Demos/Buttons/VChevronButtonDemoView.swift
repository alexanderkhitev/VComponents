//
//  VChevronButtonDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 12/23/20.
//

import SwiftUI
import VComponents

// MARK:- V Chevron Button Demo View
struct VChevronButtonDemoView: View {
    // MARK: Properties
    static let navigationBarTitle: String = "Chevron Button"

    @State private var buttonState: VChevronButtonState = .enabled
    
    private let largerHitBoxButtonModel: VChevronButtonModel = {
        var model: VChevronButtonModel = .init()
        
        model.layout.hitBoxHor = 10
        model.layout.hitBoxVer = 10
        
        return model
    }()
}

// MARK:- Body
extension VChevronButtonDemoView {
    var body: some View {
        VBaseView(title: Self.navigationBarTitle, content: {
            DemoView(controller: controller, content: {
                DemoRowView(type: .titled("Up"), content: {
                    VChevronButton(direction: .up, state: buttonState, action: action)
                })
                
                DemoRowView(type: .titled("Right"), content: {
                    VChevronButton(direction: .right, state: buttonState, action: action)
                })
                
                DemoRowView(type: .titled("Down"), content: {
                    VChevronButton(direction: .down, state: buttonState, action: action)
                })
                
                DemoRowView(type: .titled("Left"), content: {
                    VChevronButton(direction: .left, state: buttonState, action: action)
                })
                
                DemoRowView(type: .titled("Larger Hit Box"), content: {
                    VChevronButton(model: largerHitBoxButtonModel, direction: .right, state: buttonState, action: action)
                })
            })
        })
    }
    
    private var controller: some View {
        DemoRowView(type: .controller, content: {
            ToggleSettingView(
                state: .init(
                    get: { buttonState == .disabled ? .on : .off },
                    set: { buttonState = $0.isOn ? .disabled : .enabled }
                ),
                title: "Disabled"
            )
        })
    }
}

// MARK:- Action
private extension VChevronButtonDemoView {
    func action() {
        print("Pressed")
    }
}

// MARK: Preview
struct VChevronButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VChevronButtonDemoView()
    }
}