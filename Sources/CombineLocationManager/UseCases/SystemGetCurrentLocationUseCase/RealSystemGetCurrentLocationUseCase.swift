//
//  RealSystemGetCurrentLocationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 28.04.2023.
//

import Combine

public struct RealSystemGetCurrentLocationUseCase {
    
    // MARK: - Properties
    
    private let locationManager: LocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetCurrentLocationUseCase

extension RealSystemGetCurrentLocationUseCase: SystemGetCurrentLocationUseCase {
    
    public func execute() -> AnyPublisher<SystemLocation, Never> {
        Just(locationManager.requestLocation())
            .flatMap { locationManager.locationsStream.first() }
            .compactMap { $0.last }
            .eraseToAnyPublisher()
    }
}

