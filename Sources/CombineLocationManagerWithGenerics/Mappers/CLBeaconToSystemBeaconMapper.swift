//
//  CLBeaconToSystemBeaconMapper.swift
//  
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import CoreLocation

struct CLBeaconToSystemBeaconMapper {
    
    func map<T: SystemBeacon>(from model: CLBeacon) -> T where T.Constraint: SystemBeaconIdentityConstraint {
        .init(
            uuid: model.uuid,
            major: model.minor,
            minor: model.minor,
            proximity: .init(rawValue: model.proximity.rawValue) ?? .unknown,
            accuracy: model.accuracy,
            rssi: model.rssi,
            beaconIdentityConstraint: T.Constraint(
                uuid: model.uuid
            )
        )
    }
}
