//
//  SystemGetLastLocationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

import Combine
import Foundation

public protocol SystemGetLastLocationUseCase {
    
    func execute<T: SystemLocation>() -> AnyPublisher<T?, Never> where T.Coordinate: SystemCoordinate
}

public struct RealSystemGetLastLocationUseCase {
    
    // MARK: - Properties
    
    private let locationManager: any SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: any SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetLastLocationUseCase implementation

extension RealSystemGetLastLocationUseCase: SystemGetLastLocationUseCase {
    
    public func execute<T>() -> AnyPublisher<T?, Never> where T : SystemLocation, T.Coordinate : SystemCoordinate {
        Just(locationManager.requestLocation())
            .flatMap { locationManager.getLocationsStream().replaceError(with: []).eraseToAnyPublisher() }
            .compactMap { $0.last }
            .eraseToAnyPublisher()
    }
}
