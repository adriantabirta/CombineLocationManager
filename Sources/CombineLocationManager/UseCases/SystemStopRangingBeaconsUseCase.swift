//  
//  StopRangingBeaconsUseCase.swift
//
//
//  Created by at on 03.02.2023.
//

public protocol SystemStopRangingBeaconsUseCase {
    
    func execute(_ constraint: SystemBeaconIdentityConstraint)
}

public struct RealSystemStopRangingBeaconsUseCase {
    
    // MARK: - Dependencies
    
    private var locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStopRangingBeaconsUseCase implementation

extension RealSystemStopRangingBeaconsUseCase: SystemStopRangingBeaconsUseCase {
    
    public func execute(_ constraint: SystemBeaconIdentityConstraint) {
        locationManager.stopRangingBeacons(satisfying: constraint)
    }
}
