//
//  SystemExitRegionStreamUseCase.swift
//
//
//  Created by at-plan-net on 02.02.2023.
//

import Combine

public protocol SystemExitRegionStreamUseCase {
    
    func execute<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint
}

public struct RealSystemExitRegionStreamUseCase {
    
    // MARK: - Dependencies
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemExitRegionStreamUseCase implementation

extension RealSystemExitRegionStreamUseCase: SystemExitRegionStreamUseCase {
    
    public func execute<T>() -> AnyPublisher<T, Never> where T : SystemRegion, T.Constraint : SystemBeaconIdentityConstraint {
        locationManagerDelegate.getExitRegionStream()
    }
}
