//
//  RealSystemExitRegionStreamUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 02.02.2023.
//

import Combine

public struct RealSystemExitRegionStreamUseCase {
    
    // MARK: - Dependencies
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemExitRegionStreamUseCase

extension RealSystemExitRegionStreamUseCase: SystemExitRegionStreamUseCase {
    
    public func execute() -> AnyPublisher<SystemRegion, Never> {
        locationManagerDelegate.exitRegionStream
    }
}
