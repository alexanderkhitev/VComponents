//
//  ModalSizes.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 22.05.22.
//

import Foundation
import VCore

// MARK: Modal Sizes
/// Model that represents modal sizes.
public struct ModalSizes<ModalSizeMeasurement>
    where ModalSizeMeasurement: ScreenRelativeSizeMeasurement
{
    // MARK: Properties
    /// Portrait size configuration.
    public var portrait: SizeConfiguration
    
    /// Landscape size configuration.
    public var landscape: SizeConfiguration
    
    /// Current size configuration based on interface orientation.
    public var current: SizeConfiguration? {
#if canImport(UIKit)
        switch DeviceInterfaceOrientation() {
        case nil: return nil
        case .portrait: return portrait
        case .landscape: return landscape
        }
#else
        fatalError() // Not supported
#endif
    }
    
    var _current: SizeConfiguration {
        current ?? portrait
    }
    
    // MARK: Initializers
    /// Initializes `ModalSizes` with size configurations.
    public init(
        portrait: SizeConfiguration,
        landscape: SizeConfiguration
    ) {
        self.portrait = portrait
        self.landscape = landscape
    }
    
    /// Initializes `ModalSizes` with size configuration.
    public init(
        _ configuration: SizeConfiguration
    ) {
        self.portrait = configuration
        self.landscape = configuration
    }
}

// MARK: - Size Configuration
extension ModalSizes {
    /// Enum that represents state, either `point` or `relative`.
    public enum SizeConfiguration {
        // MARK: Cases
        /// Size configuration with fixed sizes represented in points.
        case point(ModalSizeMeasurement)
        
        /// Size configuration with ratios relative to screen sizes.
        case fraction(ModalSizeMeasurement)
        
        // MARK: Properties
        /// Size configuration represented in points.
        ///
        /// `point` configuration is returned directly,
        /// while `relative` configurations are multiplied by the screen size.
        public var size: ModalSizeMeasurement {
            switch self {
            case .point(let size): return size
            case .fraction(let size): return ModalSizeMeasurement.relativeMeasurementToPoints(size)
            }
        }
    }
}

// MARK: Equatable, Hashable, Comparable

extension ModalSizes: Equatable where ModalSizeMeasurement: Equatable {}

extension ModalSizes: Hashable where ModalSizeMeasurement: Hashable {}

extension ModalSizes: Comparable where ModalSizeMeasurement: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        isLess(lhs, than: rhs, by: \.portrait, \.landscape)
    }
}

extension ModalSizes.SizeConfiguration: Equatable where ModalSizeMeasurement: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.point(let lhs), .point(let rhs)): return lhs == rhs
        case (.point(let lhs), .fraction(let rhs)): return lhs == ModalSizeMeasurement.relativeMeasurementToPoints(rhs)
        case (.fraction(let lhs), .point(let rhs)): return ModalSizeMeasurement.relativeMeasurementToPoints(lhs) == rhs
        case (.fraction(let lhs), .fraction(let rhs)): return lhs == rhs
        }
    }
}

extension ModalSizes.SizeConfiguration: Hashable where ModalSizeMeasurement: Hashable {}

extension ModalSizes.SizeConfiguration: Comparable where ModalSizeMeasurement: Comparable {}
