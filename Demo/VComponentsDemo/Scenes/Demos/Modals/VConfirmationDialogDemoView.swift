//
//  VConfirmationDialogDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 2/1/21.
//

import SwiftUI
import VComponents

// MARK: - V Confirmation Dialog Demo View
struct VConfirmationDialogDemoView: View {
    // MARK: Properties
    static var navBarTitle: String { "Confirmation Dialog" }
    
    @State private var isPresented: Bool = false

    // MARK: Body
    var body: some View {
        DemoView(
            component: component
        )
            .inlineNavigationTitle(Self.navBarTitle)
    }
    
    private func component() -> some View {
        VPlainButton(
            action: { isPresented = true },
            title: "Present"
        )
            .vConfirmationDialog(
                isPresented: $isPresented,
                title: "Lorem Ipsum Dolor Sit Amet",
                message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                actions: {
                    VConfirmationDialogButton(action: {}, title: "Option A")
                    VConfirmationDialogButton(action: {}, title: "Option B")
                    VConfirmationDialogDestructiveButton(action: {}, title: "Delete")
                    VConfirmationDialogCancelButton(action: nil)
                }
            )
    }
}

// MARK: - Preview
struct VConfirmationDialogDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VConfirmationDialogDemoView()
    }
}