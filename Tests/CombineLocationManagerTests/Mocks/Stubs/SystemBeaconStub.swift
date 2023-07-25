//
//  SystemBeaconStub.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

import Foundation
@testable import CombineLocationManager

// swiftlint: disable force_unwrapping
extension SystemBeacon: Stubbable {
    
    static func stub() -> SystemBeacon {
        .init(
            uuid: .init(uuidString: "308b7f82-a701-11ed-afa1-0242ac120002")!,
            major: 1,
            minor: 1,
            proximity: .near,
            accuracy: 0.5,
            rssi: 50,
            beaconIdentityConstraint: SystemBeaconIdentityConstraint.stub()
        )
    }
}
