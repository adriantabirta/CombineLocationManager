//
//  RealSystemStartMonitoringRegionUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 09.02.2023.
//

public struct RealSystemStartMonitoringRegionUseCase {
    
    // MARK: - Properties
    
    private let locationManager: LocationManager
    
    // MARK: - Init
    
    public init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStartMonitoringRegionUseCase

extension RealSystemStartMonitoringRegionUseCase: SystemStartMonitoringRegionUseCase {
    
    public func execute(_ region: RegionProtocol) {
        locationManager.startMonitoring(for: region)
    }
}
