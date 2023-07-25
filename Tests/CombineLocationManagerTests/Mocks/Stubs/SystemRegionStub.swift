//
//  SystemRegionStub.swift
//
//
//  Created by at-plan-net on 01.03.2023.
//

@testable import CombineLocationManager

extension SystemRegion: Stubbable {
    
    static func stub() -> SystemRegion {
        .init(
            identifier: "id",
            notifyOnEntry: true,
            notifyOnExit: true,
            systemBeaconIdentityConstraint: SystemBeaconIdentityConstraint.stub()
        )
    }
}
