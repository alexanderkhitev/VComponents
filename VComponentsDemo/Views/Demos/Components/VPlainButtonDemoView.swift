//
//  VPlainButtonDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI
import VComponents

// MARK:- V Plain Button Demo View
struct VPlainButtonDemoView: View {
    // MARK: Properties
    static let navigationBarTitle: String = "Plain Button"
    
    private let buttonTitle: String = "Press"
    
    private func buttonContent() -> some View {
        Image(systemName: "swift")
            .resizable()
            .frame(size: .init(width: 20, height: 20))
            .foregroundColor(ColorBook.accent)
    }
    
    @State private var buttonState: VPlainButtonState = .enabled
    
    let clippedHitBoxButtonModel: VPlainButtonModel = .init(
        layout: .init(
            hitBoxSpacingX: 0,
            hitBoxSpacingY: 0
        )
    )
}

// MARK:- Body
extension VPlainButtonDemoView {
    var body: some View {
        BaseDemoView(title: Self.navigationBarTitle, controller: { controller }, content: {
            DemoRowView(type: .titled("Text"), content: {
                VPlainButton(state: buttonState, action: action, title: buttonTitle)
            })
            
            DemoRowView(type: .titled("Image"), content: {
                VPlainButton(state: buttonState, action: action, content: buttonContent)
            })
            
            DemoRowView(type: .titled("Image and Text"), content: {
                VPlainButton(state: buttonState, action: action, content: {
                    VStack(spacing: 5, content: {
                        buttonContent()
                        Text(buttonTitle)
                    })
                })
            })
            
            DemoRowView(type: .titled("Clipped Hit Box"), content: {
                VPlainButton(model: clippedHitBoxButtonModel, state: buttonState, action: action, title: buttonTitle)
            })
        })
    }
    
    private var controller: some View {
        DemoRowView(type: .controller, content: {
            ToggleSettingView(
                isOn: .init(
                    get: { buttonState == .disabled },
                    set: { buttonState = $0 ? .disabled : .enabled }
                ),
                title: "Disabled"
            )
        })
    }
}

// MARK:- Action
private extension VPlainButtonDemoView {
    func action() {
        print("Pressed")
    }
}

// MARK: Preview
struct VPlainButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VPlainButtonDemoView()
    }
}