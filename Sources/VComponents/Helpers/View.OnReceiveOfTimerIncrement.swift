//
//  View.OnReceiveOfTimerIncrement.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 08.03.23.
//

import SwiftUI

// MARK: - View on Receive of Timer Increment
extension View {
    func onReceiveOfTimerIncrement(
        _ value: Binding<Int>,
        to total: Int,
        by increment: Int = 1
    ) -> some View {
        self
            .onReceive(
                Timer.publish(every: 1, on: .main, in: .common).autoconnect(),
                perform: { _ in
                    var valueToSet: Int = value.wrappedValue + increment
                    if valueToSet > total { valueToSet = 0 }
                    
                    value.wrappedValue = valueToSet
                }
            )
    }
    
    func onReceiveOfTimerIncrement(
        _ value: Binding<Double>,
        to total: Double,
        by increment: Double = 1
    ) -> some View {
        self
            .onReceive(
                Timer.publish(every: 1, on: .main, in: .common).autoconnect(),
                perform: { _ in
                    var valueToSet: Double = value.wrappedValue + increment
                    if valueToSet > total { valueToSet = 0 }
                    
                    value.wrappedValue = valueToSet
                }
            )
    }
}
