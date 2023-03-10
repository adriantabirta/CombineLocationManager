//
//  SystemStopMonitoringRegionUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 09.02.2023.
//

import CoreLocation

public protocol SystemStopMonitoringRegionUseCase {
    
    func execute(_ region: RegionProtocol)
}
