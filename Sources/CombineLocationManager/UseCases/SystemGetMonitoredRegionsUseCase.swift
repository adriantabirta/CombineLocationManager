//
//  SystemGetMonitoredRegionsUseCase.swift
//
//
//  Created by at-plan-net on 02.02.2023.
//

public protocol SystemGetMonitoredRegionsUseCase {
    
    func execute() -> Set<SystemRegion>
}

public struct RealSystemGetMonitoredRegionsUseCase {
    
    // MARK: - Properties

    private let locationManager: SystemLocationManager
    
    // MARK: - Init

    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetMonitoredRegionsUseCase

extension RealSystemGetMonitoredRegionsUseCase: SystemGetMonitoredRegionsUseCase {
    
    public func execute() -> Set<SystemRegion> {
        locationManager.currentMonitoredRegions
    }
}
