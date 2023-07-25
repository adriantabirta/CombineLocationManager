//
//  SystemBeaconIdentityConstraintStub.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

import Foundation
@testable import CombineLocationManager

// swiftlint: disable force_unwrapping
extension SystemBeaconIdentityConstraint: Stubbable {
    
    static func stub() -> SystemBeaconIdentityConstraint {
        .init(
            uuid: UUID(uuidString: "308b7f82-a701-11ed-afa1-0242ac120002")!
        )
    }
}
