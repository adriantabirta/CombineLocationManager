//
//  SystemBeaconRegionStub.swift
//
//
//  Created by at-plan-net on 10.03.2023.
//

import Foundation
@testable import CombineLocationManager

// swiftlint: disable force_unwrapping
extension SystemBeaconRegion: Stubbable {
    
    static func stub() -> SystemBeaconRegion {
        let uuid = UUID(uuidString: "308b7f82-a701-11ed-afa1-0242ac120002")!
        return .init(
            identifier: "id",
            uuid: uuid,
            beaconIdentityConstraintDataModel: SystemBeaconIdentityConstraint.init(uuid: uuid),
            notifyOnEntry: true,
            notifyOnExit: true
        )
    }
}
