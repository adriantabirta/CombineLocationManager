//
//  SystemDidDetermineStateForRegionUseCase.swift
//
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import Combine

public protocol SystemDidDetermineStateForRegionUseCase {
    
    func execute<T: SystemRegion>() -> AnyPublisher<(SystemRegionState, T), Never> where T.Constraint: SystemBeaconIdentityConstraint
}

public struct RealSystemDidDetermineStateForRegionUseCase {
    
    // MARK: - Dependencies
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemDidDetermineStateForRegionUseCase implementation

extension RealSystemDidDetermineStateForRegionUseCase: SystemDidDetermineStateForRegionUseCase {
    
    public func execute<T>() -> AnyPublisher<(SystemRegionState, T), Never> where T: SystemRegion, T.Constraint: SystemBeaconIdentityConstraint {
        locationManagerDelegate.didDetermineStateForRegion()
    }
}
