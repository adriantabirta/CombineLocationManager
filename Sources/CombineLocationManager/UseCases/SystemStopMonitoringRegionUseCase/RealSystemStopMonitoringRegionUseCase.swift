//
//  RealSystemStopMonitoringRegionUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 09.02.2023.
//

public struct RealSystemStopMonitoringRegionUseCase {
    
    // MARK: - Dependencies
    
    private var locationManager: LocationManager
    
    // MARK: - Init

    public init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStopMonitoringRegionUseCase

extension RealSystemStopMonitoringRegionUseCase: SystemStopMonitoringRegionUseCase {
    
    public func execute(_ region: RegionProtocol) {
        locationManager.stopMonitoring(for: region)
    }
}
