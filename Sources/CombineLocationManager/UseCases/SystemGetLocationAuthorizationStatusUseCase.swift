//
//  SystemGetLocationAuthorizationStatusUseCase.swift
//
//
//  Created by at-plan-net on 01.03.2023.
//

import Combine

public protocol SystemGetLocationAuthorizationStatusUseCase {
    
    func execute() -> AnyPublisher<SystemLocationAuthorizationStatus, Never>
}

public struct RealSystemGetLocationAuthorizationStatusUseCase {
    
    // MARK: - Properties
    
    private let locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetLocationAuthorizationStatusUseCase

extension RealSystemGetLocationAuthorizationStatusUseCase: SystemGetLocationAuthorizationStatusUseCase {
    
    public func execute() -> AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        Just(locationManager.currentAuthorizationStatus).eraseToAnyPublisher()
    }
}
