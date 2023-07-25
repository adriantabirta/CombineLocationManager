//
//  SystemGetLocationsStreamUseCase.swift
//
//
//  Created by at-plan-net on 27.02.2023.
//

import Combine
import CoreLocation

public protocol SystemGetLocationsStreamUseCase {
    
    func execute() -> AnyPublisher<[SystemLocation], Error>
}

public struct RealSystemGetLocationsStreamUseCase {
    
    // MARK: - Properties
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemStopMonitoringRegionUseCase

extension RealSystemGetLocationsStreamUseCase: SystemGetLocationsStreamUseCase {
    
    public func execute() -> AnyPublisher<[SystemLocation], Error> {
        locationManagerDelegate.locationsStream
    }
}
