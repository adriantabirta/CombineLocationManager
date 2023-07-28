//
//  SystemStartMonitoringRegionUseCase.swift
//
//
//  Created by at-plan-net on 09.02.2023.
//

public protocol SystemStartMonitoringRegionUseCase {
    
    func execute(_ region: RegionProtocol)
}

public struct RealSystemStartMonitoringRegionUseCase {
    
    // MARK: - Properties
    
    private let locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStartMonitoringRegionUseCase

extension RealSystemStartMonitoringRegionUseCase: SystemStartMonitoringRegionUseCase {
    
    public func execute(_ region: RegionProtocol) {
        locationManager.startMonitoring(for: region)
    }
}
