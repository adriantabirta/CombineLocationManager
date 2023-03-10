//
//  SystemGetMonitoredRegionsUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 02.02.2023.
//

import CoreLocation

public protocol SystemGetMonitoredRegionsUseCase {
    
    func execute() -> Set<SystemRegion>
}
