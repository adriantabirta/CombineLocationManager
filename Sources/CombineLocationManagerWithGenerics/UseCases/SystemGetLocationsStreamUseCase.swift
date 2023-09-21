//
//  SystemGetLocationsStreamUseCase.swift
//
//
//  Created by at-plan-net on 27.02.2023.
//

import Combine
import CoreLocation

public protocol SystemGetLocationsStreamUseCase {
    
    func execute<T: SystemLocation>() -> AnyPublisher<[T], Error> where T.Coordinate: SystemCoordinate
}

public struct RealSystemGetLocationsStreamUseCase {
    
    // MARK: - Properties
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemStopMonitoringRegionUseCase implementation

extension RealSystemGetLocationsStreamUseCase: SystemGetLocationsStreamUseCase {
    
    public func execute<T>() -> AnyPublisher<[T], Error> where T : SystemLocation, T.Coordinate : SystemCoordinate {
        locationManagerDelegate.getLocationsStream()
    }
}
