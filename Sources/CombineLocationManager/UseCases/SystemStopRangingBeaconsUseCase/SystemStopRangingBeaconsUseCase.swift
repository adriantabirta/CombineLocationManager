//  
//  StopRangingBeaconsUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 03.02.2023.
//

import CoreLocation

public protocol SystemStopRangingBeaconsUseCase {
    
    func execute(_ constraint: SystemBeaconIdentityConstraint)
}
