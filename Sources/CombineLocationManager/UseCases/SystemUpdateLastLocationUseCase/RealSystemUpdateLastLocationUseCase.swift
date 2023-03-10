//
//  RealSystemUpdateLastLocationUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 01.03.2023.
//

import Combine

public struct RealSystemUpdateLastLocationUseCase {
    
    // MARK: - Dependencies
    
    private var locationManager: LocationManager
    
    public init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemUpdateLastLocationUseCase

extension RealSystemUpdateLastLocationUseCase: SystemUpdateLastLocationUseCase {
    
    public func execute() -> AnyPublisher<Void, Never> {
        Just(locationManager.startUpdatingLocation())
            .flatMap { locationManager.locationsStream }
            .map { _ in locationManager.stopUpdatingLocation() }
            .eraseToAnyPublisher()
    }
}
