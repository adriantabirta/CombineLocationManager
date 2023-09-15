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
    
    private let locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetLastLocationUseCase

extension RealSystemGetLastLocationUseCase: SystemGetLastLocationUseCase {
    
    public func execute() -> AnyPublisher<SystemLocation?, Never> {
        Just(locationManager.requestLocation())
            .flatMap { locationManager.locationsStream.replaceError(with: []).eraseToAnyPublisher() }
            .map { $0.last }
            .eraseToAnyPublisher()
    }
}
