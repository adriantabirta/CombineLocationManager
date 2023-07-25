//
//  SystemGetLastLocationUseCase.swift
//
//
//  Created by at-plan-net on 01.03.2023.
//

import Combine

public protocol SystemGetLastLocationUseCase {
    
    func execute() -> AnyPublisher<SystemLocation?, Never>
}

public struct RealSystemGetLastLocationUseCase {
    
    // MARK: - Properties
    
    private let locationManager: LocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetLastLocationUseCase

extension RealSystemGetLastLocationUseCase: SystemGetLastLocationUseCase {
    
    public func execute() -> AnyPublisher<SystemLocation?, Never> {
        Just(locationManager.lastLocation).eraseToAnyPublisher()
    }
}
