//
//  RealSystemGetMonitoredGeofenceRegionsUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 01.02.2023.
//

import CoreLocation

public struct RealSystemGetMonitoredRegionsUseCase {
    
    // MARK: - Properties

    private let locationManager: LocationManager
    
    // MARK: - Init

    public init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetMonitoredRegionsUseCase

extension RealSystemGetMonitoredRegionsUseCase: SystemGetMonitoredRegionsUseCase {
    
    public func execute() -> Set<SystemRegion> {
        locationManager.currentMonitoredRegions
    }
}
