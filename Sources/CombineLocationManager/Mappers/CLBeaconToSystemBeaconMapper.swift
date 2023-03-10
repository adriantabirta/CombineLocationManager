//
//  CLBeaconToSystemBeaconMapper.swift
//  
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import CoreLocation

struct CLBeaconToSystemBeaconMapper {
    
    func map(from model: CLBeacon) -> SystemBeacon {
        .init(
            uuid: model.uuid,
            major: model.minor,
            minor: model.minor,
            proximity: .init(rawValue: model.proximity.rawValue) ?? .unknown,
            accuracy: model.accuracy,
            rssi: model.rssi,
            beaconIdentityConstraint: SystemBeaconIdentityConstraint(
                uuid: model.uuid
            )
        )
    }
}
