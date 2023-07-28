//
//  SystemStartRangingBeaconsUseCase.swift
//
//
//  Created by at-plan-net on 03.02.2023.
//

protocol SystemStartRangingBeaconsUseCase {
    
    func execute(_ constraint: SystemBeaconIdentityConstraint)
}

public struct RealSystemStartRangingBeaconsUseCase {
    
    // MARK: - Properties
    
    private let locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStartRangingBeaconsUseCase

extension RealSystemStartRangingBeaconsUseCase: SystemStartRangingBeaconsUseCase {
    
    func execute(_ constraint: SystemBeaconIdentityConstraint) {
        locationManager.startRangingBeacons(satisfying: constraint)
    }
}
