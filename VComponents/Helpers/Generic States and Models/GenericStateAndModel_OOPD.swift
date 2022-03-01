//
//  GenericStateAndModel_OOPD.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 3/1/22.
//

import SwiftUI

// MARK: - Generic State (Off, On, Pressed, Disabled)
enum GenericState_OOPD {
    // MARK: Cases
    case off
    case on
    case pressedOff
    case pressedOn
    case disabled
    
    // MARK: Properties
    var isEnabled: Bool {
        switch self {
        case .off: return true
        case .on: return true
        case .pressedOff: return true
        case .pressedOn: return true
        case .disabled: return false
        }
    }
    
    // MARK: Initializers
    fileprivate init(isEnabled: Bool, isOn: Bool, isPressed: Bool) {
        switch (isEnabled, isOn, isPressed) {
        case (false, _, _): self = .disabled
        case (true, false, false): self = .off
        case (true, false, true): self = .pressedOff
        case (true, true, false): self = .on
        case (true, true, true): self = .pressedOn
        }
    }
    
    // MARK: Next State
    mutating func setNextState() {
        switch self {
        case .off, .pressedOff: self = .on
        case .on, .pressedOn: self = .off
        case .disabled: break
        }
    }
}

extension GenericState_OOPD {
    init(isEnabled: Bool, state: VToggleState, isPressed: Bool) {
        self.init(isEnabled: isEnabled, isOn: state.isOn, isPressed: isPressed)
    }
    
    init(isEnabled: Bool, state: VRadioButtonState, isPressed: Bool) {
        self.init(isEnabled: isEnabled, isOn: state.isOn, isPressed: isPressed)
    }
}

// MARK: - Generic State Model (Off, On, Pressed, Disabled)
/// Color group containing `off`, `on`, and `disabled` values.
public struct GenericStateModel_OOPD<Value> {
    // MARK: Properties
    /// Off value.
    public var off: Value
    
    /// On value.
    public var on: Value
    
    /// Off pressed value.
    public var pressedOff: Value
    
    /// On pressed value.
    public var pressedOn: Value
    
    /// Disabled value.
    public var disabled: Value
    
    // MARK: Initializers
    /// Initializes group with values.
    public init(
        off: Value,
        on: Value,
        pressedOff: Value,
        pressedOn: Value,
        disabled: Value
    ) {
        self.off = off
        self.on = on
        self.pressedOff = pressedOff
        self.pressedOn = pressedOn
        self.disabled = disabled
    }
}

extension GenericStateModel_OOPD: Equatable where Value: Equatable {}

// MARK: - Mapping
extension GenericStateModel_OOPD {
    func `for`(_ state: GenericState_OOPD) -> Value {
        switch state {
        case .off: return off
        case .on: return on
        case .pressedOff: return pressedOff
        case .pressedOn: return pressedOn
        case .disabled: return disabled
        }
    }
}
