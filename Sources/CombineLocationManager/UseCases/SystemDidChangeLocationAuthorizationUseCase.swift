//
//  SystemDidChangeLocationAuthorizationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 25.07.2023.
//

import Combine

public protocol SystemDidChangeLocationAuthorizationUseCase {
    
    func execute() -> AnyPublisher<SystemLocationAuthorizationStatus, Never>
}

public struct RealSystemDidChangeLocationAuthorizationUseCase {
    
    // MARK: - Dependencies
    
    private var locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemDidChangeLocationAuthorizationUseCase implementation

extension RealSystemDidChangeLocationAuthorizationUseCase: SystemDidChangeLocationAuthorizationUseCase {
    
    public func execute() -> AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        locationManager.didChangeAuthorization
    }
}
