//
//  SystemStartRangingBeaconsUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 03.02.2023.
//

import CoreLocation

protocol SystemStartRangingBeaconsUseCase {
    
    func execute(_ constraint: SystemBeaconIdentityConstraint)
}
