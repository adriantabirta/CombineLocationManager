//
//  SystemDidChangeAuthorizationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 25.07.2023.
//

import Combine

public protocol SystemDidChangeAuthorizationUseCase {
    
    func execute() -> AnyPublisher<SystemLocationAuthorizationStatus, Never>
}

struct RealSystemDidChangeAuthorizationUseCase {
    
    // MARK: - Dependencies
    
    private var locationManager: LocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemDidChangeAuthorizationUseCase

extension RealSystemDidChangeAuthorizationUseCase: SystemDidChangeAuthorizationUseCase {
    
    func execute() -> AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        locationManager.didChangeAuthorization
    }
}