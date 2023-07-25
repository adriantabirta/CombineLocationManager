//
//  SystemStopMonitoringRegionUseCase.swift
//
//
//  Created by at-plan-net on 09.02.2023.
//

public protocol SystemStopMonitoringRegionUseCase {
    
    func execute(_ region: RegionProtocol)
}

public struct RealSystemStopMonitoringRegionUseCase {
    
    // MARK: - Dependencies
    
    private var locationManager: LocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStopMonitoringRegionUseCase

extension RealSystemStopMonitoringRegionUseCase: SystemStopMonitoringRegionUseCase {
    
    public func execute(_ region: RegionProtocol) {
        locationManager.stopMonitoring(for: region)
    }
}