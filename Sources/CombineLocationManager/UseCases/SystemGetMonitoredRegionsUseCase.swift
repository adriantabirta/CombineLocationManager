//
//  SystemGetMonitoredRegionsUseCase.swift
//
//
//  Created by at on 02.02.2023.
//

public protocol SystemGetMonitoredRegionsUseCase {
    
    func execute<T: SystemRegion>() -> [T]
}

public struct RealSystemGetMonitoredRegionsUseCase {
    
    // MARK: - Properties
    
    private let locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemGetMonitoredRegionsUseCase implementation

extension RealSystemGetMonitoredRegionsUseCase: SystemGetMonitoredRegionsUseCase {
    
    public func execute<T>() -> [T] where T: SystemRegion {
        locationManager.getCurrentMonitoredRegions()
    }
}
