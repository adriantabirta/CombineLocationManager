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
    
    private let locationManager: LocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStartRangingBeaconsUseCase

extension RealSystemStartRangingBeaconsUseCase: SystemStartRangingBeaconsUseCase {
    
    func execute(_ constraint: SystemBeaconIdentityConstraint) {
        locationManager.startRangingBeacons(satisfying: constraint)
    }
}