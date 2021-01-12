//
//  VPrimaryButtonState.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import Foundation

// MARK:- V Primary Button State
public enum VPrimaryButtonState: Int, CaseIterable {
    case enabled
    case disabled
    case loading
    
    var isDisabled: Bool {
        switch self {
        case .enabled: return false
        case .disabled: return true
        case .loading: return true
        }
    }
}

// MARK:- V Primary Button Internal State
enum VPrimaryButtonInternalState {
    case enabled
    case pressed
    case disabled
    case loading
    
    var isLoading: Bool {
        switch self {
        case .enabled: return false
        case .pressed: return false
        case .disabled: return false
        case .loading: return true
        }
    }
    
    init(state: VPrimaryButtonState, isPressed: Bool) {
        switch (state, isPressed) {
        case (.enabled, false): self = .enabled
        case (.enabled, true): self = .pressed
        case (.disabled, _): self = .disabled
        case (.loading, _): self = .loading
        }
    }
}