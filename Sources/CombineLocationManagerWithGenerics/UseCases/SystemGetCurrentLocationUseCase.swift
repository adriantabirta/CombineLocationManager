//
//  SystemGetCurrentLocationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 28.04.2023.
//

import Combine

public protocol SystemGetCurrentLocationUseCase {
    
    func execute<T: SystemLocation>() -> AnyPublisher<T, Error> where T.Coordinate: SystemCoordinate
}

public struct RealSystemGetCurrentLocationUseCase {
    
    // MARK: - Properties
    
    private let locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetCurrentLocationUseCase implementation

extension RealSystemGetCurrentLocationUseCase: SystemGetCurrentLocationUseCase {
    
    public func execute<T>() -> AnyPublisher<T, Error> where T : SystemLocation, T.Coordinate : SystemCoordinate {
        Just(locationManager.requestLocation())
            .setFailureType(to: Error.self)
            .flatMap { locationManager.getLocationsStream().first() }
            .compactMap { $0.last }
            .eraseToAnyPublisher()
    }
}
