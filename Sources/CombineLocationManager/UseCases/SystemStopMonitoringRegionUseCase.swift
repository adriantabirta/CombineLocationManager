//
//  SystemStopMonitoringRegionUseCase.swift
//
//
//  Created by at on 09.02.2023.
//

public protocol SystemStopMonitoringRegionUseCase {
    
    func execute(_ region: SystemGenericRegion)
}

public struct RealSystemStopMonitoringRegionUseCase {
    
    // MARK: - Dependencies
    
    private var locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStopMonitoringRegionUseCase implementation

extension RealSystemStopMonitoringRegionUseCase: SystemStopMonitoringRegionUseCase {
    
    public func execute(_ region: SystemGenericRegion) {
        locationManager.stopMonitoring(for: region)
    }
}
