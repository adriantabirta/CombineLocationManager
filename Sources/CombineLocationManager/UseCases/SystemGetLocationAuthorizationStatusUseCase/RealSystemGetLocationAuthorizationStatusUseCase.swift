//
//  RealSystemGetLocationAuthorizationStatusUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 01.03.2023.
//

import Combine

public struct RealSystemGetLocationAuthorizationStatusUseCase {
    
    // MARK: - Properties
    
    private let locationManager: LocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetLocationAuthorizationStatusUseCase

extension RealSystemGetLocationAuthorizationStatusUseCase: SystemGetLocationAuthorizationStatusUseCase {
    
    public func execute() -> AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        Just(locationManager.currentAuthorizationStatus).eraseToAnyPublisher()
    }
}
