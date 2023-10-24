//
//  SystemDidRangeBeaconsStreamUseCase.swift
//
//
//  Created by at on 03.02.2023.
//

import Combine
import CoreLocation

public protocol SystemDidRangeBeaconsStreamUseCase {
    
    func execute<T: SystemBeacon>() -> AnyPublisher<[T], Error> where T.Constraint: SystemBeaconIdentityConstraint
}

public struct RealSystemDidRangeBeaconsStreamUseCase {
    
    // MARK: - Dependencies
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemDidRangeBeaconsStreamUseCase implementation

extension RealSystemDidRangeBeaconsStreamUseCase: SystemDidRangeBeaconsStreamUseCase {
    
    public func execute<T>() -> AnyPublisher<[T], Error> where T: SystemBeacon, T.Constraint: SystemBeaconIdentityConstraint {
        locationManagerDelegate.didRangeBeacons()
    }
}
