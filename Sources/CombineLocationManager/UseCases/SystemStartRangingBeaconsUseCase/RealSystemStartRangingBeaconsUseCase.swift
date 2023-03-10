//
//  RealSystemStartRangingBeaconsUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 03.02.2023.
//

public struct RealSystemStartRangingBeaconsUseCase {
    
    // MARK: - Properties
    
    private let locationManager: LocationManager
    
    // MARK: - Init
    
    public init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStartRangingBeaconsUseCase

extension RealSystemStartRangingBeaconsUseCase: SystemStartRangingBeaconsUseCase {
    
    func execute(_ constraint: SystemBeaconIdentityConstraint) {
        locationManager.startRangingBeacons(satisfying: constraint)
    }
}
