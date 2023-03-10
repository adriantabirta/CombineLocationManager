//
//  RealSystemEnterRegionStreamUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 02.02.2023.
//

import Combine
import CoreLocation

public struct RealSystemEnterRegionStreamUseCase {
    
    // MARK: - Dependencies
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemEnterRegionStreamUseCase

extension RealSystemEnterRegionStreamUseCase: SystemEnterRegionStreamUseCase {
    
    public func execute() -> AnyPublisher<SystemRegion, Never> {
        locationManagerDelegate.enterRegionStream
    }
}
