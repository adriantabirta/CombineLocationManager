//
//  SystemBeaconIdentityConstraintStub.swift
//
//
//  Created by at on 02.03.2023.
//

import Foundation
@testable import CombineLocationManager

struct SystemBeaconIdentityConstraintStub: SystemBeaconIdentityConstraint, Equatable, Hashable {
    
    var uuid: UUID
    
    init(uuid: UUID) {
        self.uuid = uuid
    }
}

// swiftlint: disable force_unwrapping
extension SystemBeaconIdentityConstraintStub: Stubbable {
    
    static func stub() -> SystemBeaconIdentityConstraintStub {
        .init(uuid: .init(uuidString: "308b7f82-a701-11ed-afa1-0242ac120002")!)
    }
}
// swiftlint: enable force_unwrapping
