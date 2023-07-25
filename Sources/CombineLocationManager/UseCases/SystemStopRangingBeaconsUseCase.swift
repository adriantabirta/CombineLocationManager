//  
//  StopRangingBeaconsUseCase.swift
//
//
//  Created by at-plan-net on 03.02.2023.
//

public protocol SystemStopRangingBeaconsUseCase {
    
    func execute(_ constraint: SystemBeaconIdentityConstraint)
}

public struct RealSystemStopRangingBeaconsUseCase {
    
    // MARK: - Dependencies
    
    private var locationManager: LocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStopRangingBeaconsUseCase

extension RealSystemStopRangingBeaconsUseCase: SystemStopRangingBeaconsUseCase {
    
    public func execute(_ constraint: SystemBeaconIdentityConstraint) {
        locationManager.stopRangingBeacons(satisfying: constraint)
    }
}