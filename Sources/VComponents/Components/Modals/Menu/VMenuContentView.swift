//
//  VMenuContentView.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 2/1/21.
//

import SwiftUI

// MARK: - V Menu Content View
struct VMenuContentView: View {
    // MARK: Properties
    private let rows: [VMenuRow]
    
    // MARK: Initializers
    init(rows: [VMenuRow]) {
        self.rows = rows
    }

    // MARK: Body
    var body: some View {
        ForEach(rows.enumeratedArray().reversed(), id: \.offset, content: { (_, row) in
            switch row._menuRow {
            case .title(let action, let title):
                Button(title, action: action)
                
            case .titleAssetIcon(let action, let title, let name, let bundle):
                Button(action: action, label: {
                    Text(title)
                    Image(name, bundle: bundle)
                })
                
            case .titleIcon(let action, let title, let icon):
                Button(action: action, label: {
                    Text(title)
                    icon
                })
                
            case .titleSystemIcon(let action, let title, let name):
                Button(action: action, label: {
                    Text(title)
                    Image(systemName: name)
                })
            
            case .menu(let title, let rows):
                Menu(
                    content: { VMenuContentView(rows: rows) },
                    label: { Text(title) }
                )
            }
        })
    }
}

// MARK: - Preview
struct VMenuContentView_Previews: PreviewProvider {
    static var previews: some View {
        VMenu_Previews.previews
    }
}
