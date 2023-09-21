//
//  SystemStartMonitoringRegionUseCase.swift
//
//
//  Created by at-plan-net on 09.02.2023.
//

public protocol SystemStartMonitoringRegionUseCase {
    
    func execute<T: SystemGenericRegion>(_ region: T)
}

public struct RealSystemStartMonitoringRegionUseCase {
    
    // MARK: - Properties
    
    private let locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStartMonitoringRegionUseCase implementation

extension RealSystemStartMonitoringRegionUseCase: SystemStartMonitoringRegionUseCase {
    
    public func execute<T>(_ region: T) where T : SystemGenericRegion {
        locationManager.startMonitoring(for: region)
    }
}
