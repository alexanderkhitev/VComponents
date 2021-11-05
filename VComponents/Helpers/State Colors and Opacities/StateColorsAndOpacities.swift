//
//  StateColorsAndOpacities.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 2/5/21.
//

import SwiftUI

// MARK: - Enabled, Disabled | Disabled
/// Color and opacity level group containing `enabled` and `disabled` values.
public struct StateColorsAndOpacities_EP_D: Equatable {
    // MARK: Properties
    /// Enabled color.
    public var enabled: Color
    
    /// Disabled color.
    public var disabled: Color
    
    /// Disabled opacity level.
    public var disabledOpacity: Double
    
    // MARK: Initializers
    /// Initializes group with values.
    public init(
        enabled: Color,
        disabled: Color,
        disabledOpacity: Double
    ) {
        self.enabled = enabled
        self.disabled = disabled
        self.disabledOpacity = disabledOpacity
    }
    
    /// Initializes group with clear values.
    public init() {
        self.enabled = ColorBook.clear
        self.disabled = ColorBook.clear
        self.disabledOpacity = 0
    }
    
    /// Initializes group with clear values.
    public static var clear: Self { .init() }

    // MARK: Mapping
    func `for`(_ state: VTextFieldState) -> Color {
        switch state {
        case .enabled: return enabled
        case .focused: return enabled
        case .disabled: return disabled
        }
    }
    
    func `for`(_ state: VTextFieldState) -> Double {
        switch state {
        case .enabled: return 1
        case .focused: return 1
        case .disabled: return disabledOpacity
        }
    }
    
    func `for`(_ state: VBaseTextFieldState) -> Color {
        switch state {
        case .enabled: return enabled
        case .focused: return enabled
        case .disabled: return disabled
        }
    }
    
    func `for`(_ state: VBaseTextFieldState) -> Double {
        switch state {
        case .enabled: return 1
        case .focused: return 1
        case .disabled: return disabledOpacity
        }
    }
}

// MARK: - Enabled, Pressed, Disabled | Pressed, Disabled
/// Color and opacity level group containing `enabled`, `pressed`, and `disabled` values.
public struct StateColorsAndOpacities_EPD_PD: Equatable {
    // MARK: Properties
    /// Enabled color.
    public var enabled: Color
    
    /// Pressed color.
    public var pressed: Color
    
    /// Disabled color.
    public var disabled: Color
    
    /// Pressed opacity level.
    public var pressedOpacity: Double
    
    /// Disabled opacity level.
    public var disabledOpacity: Double
    
    // MARK: Initializers
    /// Initializes group with values.
    public init(
        enabled: Color,
        pressed: Color,
        disabled: Color,
        pressedOpacity: Double,
        disabledOpacity: Double
    ) {
        self.enabled = enabled
        self.pressed = pressed
        self.disabled = disabled
        self.pressedOpacity = pressedOpacity
        self.disabledOpacity = disabledOpacity
    }
    
    /// Initializes group with clear values.
    public init() {
        self.enabled = ColorBook.clear
        self.pressed = ColorBook.clear
        self.disabled = ColorBook.clear
        self.pressedOpacity = 0
        self.disabledOpacity = 0
    }
    
    /// Initializes group with clear values.
    public static var clear: Self { .init() }

    // MARK: Mapping
    func `for`(_ state: VChevronButtonInternalState) -> Color {
        switch state {
        case .enabled: return enabled
        case .pressed: return pressed
        case .disabled: return disabled
        }
    }
    
    func `for`(_ state: VChevronButtonInternalState) -> Double {
        switch state {
        case .enabled: return 1
        case .pressed: return pressedOpacity
        case .disabled: return disabledOpacity
        }
    }
    
    func `for`(_ state: VCloseButtonInternalState) -> Color {
        switch state {
        case .enabled: return enabled
        case .pressed: return pressed
        case .disabled: return disabled
        }
    }
    
    func `for`(_ state: VCloseButtonInternalState) -> Double {
        switch state {
        case .enabled: return 1
        case .pressed: return pressedOpacity
        case .disabled: return disabledOpacity
        }
    }
    
    func `for`(_ state: VStepperButtonState) -> Color {
        switch state {
        case .enabled: return enabled
        case .pressed: return pressed
        case .disabled: return disabled
        }
    }
    
    func `for`(_ state: VStepperButtonState) -> Double {
        switch state {
        case .enabled: return 1
        case .pressed: return pressedOpacity
        case .disabled: return disabledOpacity
        }
    }
}

// MARK: - Enabled, +Pressed, Focused, +Pressed, Success, +Pressed, Error, +Pressed, Disabled | Pressed, Disabled
/// Color and opacity level group containing `enabled` (+`pressed`), `focused` (+`pressed`), `success` (+`pressed`), `error` (+`pressed`), and `disabled` values.
public struct StateColors_EpFpSpEpD_PD: Equatable {
    // MARK: Properties
    /// Enabled color.
    public var enabled: Color
    
    /// Enabled pressed color.
    public var enabledPressed: Color
    
    /// Focused color.
    public var focused: Color
    
    /// Focused pressed color.
    public var focusedPressed: Color
    
    /// Success color.
    public var success: Color
    
    /// Success pressed color.
    public var successPressed: Color
    
    /// Error color.
    public var error: Color
    
    /// Error pressed color.
    public var errorPressed: Color
    
    /// Disabled color.
    public var disabled: Color
    
    /// Pressed opacity level.
    public var pressedOpacity: Double
    
    /// Disabled opacity level.
    public var disabledOpacity: Double
    
    // MARK: Initializers
    /// Initializes group with values.
    public init(
        enabled: Color,
        enabledPressed: Color,
        focused: Color,
        focusedPressed: Color,
        success: Color,
        successPressed: Color,
        error: Color,
        errorPressed: Color,
        disabled: Color,
        pressedOpacity: Double,
        disabledOpacity: Double
    ) {
        self.enabled = enabled
        self.enabledPressed = enabledPressed
        self.focused = focused
        self.focusedPressed = focusedPressed
        self.success = success
        self.successPressed = successPressed
        self.error = error
        self.errorPressed = errorPressed
        self.disabled = disabled
        self.pressedOpacity = pressedOpacity
        self.disabledOpacity = disabledOpacity
    }
    
    /// Initializes group with clear values.
    public init() {
        self.enabled = ColorBook.clear
        self.enabledPressed = ColorBook.clear
        self.focused = ColorBook.clear
        self.focusedPressed = ColorBook.clear
        self.success = ColorBook.clear
        self.successPressed = ColorBook.clear
        self.error = ColorBook.clear
        self.errorPressed = ColorBook.clear
        self.disabled = ColorBook.clear
        self.pressedOpacity = 0
        self.disabledOpacity = 0
    }
    
    /// Initializes group with clear values.
    public static var clear: Self { .init() }

    // MARK: Mapping
    func `for`(_ state: VTextFieldState, highlight: VTextFieldHighlight) -> Color {
        switch (highlight, state) {
        case (_, .disabled): return disabled
        case (.none, .enabled): return enabled
        case (.none, .focused): return focused
        case (.success, .enabled): return success
        case (.success, .focused): return success
        case (.error, .enabled): return error
        case (.error, .focused): return error
        }
    }
    
    func `for`(highlight: VTextFieldHighlight) -> Color {
        switch highlight {
        case .none: return enabledPressed
        case .success: return successPressed
        case .error: return errorPressed
        }
    }
}
