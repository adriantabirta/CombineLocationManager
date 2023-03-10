//
//  RealSystemGetLocationsStreamUseCase.swift
//  LocationManagerCombineImplementation
//
//  Created by at-plan-net on 27.02.2023.
//

import Combine

public struct RealSystemGetLocationsStreamUseCase {
    
    // MARK: - Properties
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemStopMonitoringRegionUseCase

extension RealSystemGetLocationsStreamUseCase: SystemGetLocationsStreamUseCase {
    
    public func execute() -> AnyPublisher<[SystemLocation], Never> {
        locationManagerDelegate.locationsStream
    }
}
