//
//  CLRegionToSystemRegionMapper.swift
//  
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import CoreLocation

struct CLRegionToSystemRegionMapper {
    
    func map<T: SystemRegion>(from model: CLRegion) -> T where T.Constraint: SystemBeaconIdentityConstraint {
        if let beaconRegion = model as? CLBeaconRegion {
            return .init(
                identifier: model.identifier,
                notifyOnEntry: model.notifyOnEntry,
                notifyOnExit: model.notifyOnExit,
                systemBeaconIdentityConstraint: T.Constraint(uuid: beaconRegion.uuid)
            )
        } else {
            return .init(
                identifier: model.identifier,
                notifyOnEntry: model.notifyOnEntry,
                notifyOnExit: model.notifyOnExit,
                systemBeaconIdentityConstraint: nil
            )
        }
    }
}
