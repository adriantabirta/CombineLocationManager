//
//  SystemDidRangeBeaconsStreamUseCase.swift
//
//
//  Created by at-plan-net on 03.02.2023.
//

import Combine
import CoreLocation

public protocol SystemDidRangeBeaconsStreamUseCase {
    
    func execute() -> AnyPublisher<[SystemBeacon], Error>
}

public struct RealSystemDidRangeBeaconsStreamUseCase {
    
    // MARK: - Dependencies
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemDidRangeBeaconsStreamUseCase

extension RealSystemDidRangeBeaconsStreamUseCase: SystemDidRangeBeaconsStreamUseCase {
    
    public func execute() -> AnyPublisher<[SystemBeacon], Error> {
        locationManagerDelegate.didRangeBeacons
    }
}
