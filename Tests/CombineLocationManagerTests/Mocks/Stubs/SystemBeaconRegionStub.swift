//
//  SystemBeaconRegionStub.swift
//
//
//  Created by at on 10.03.2023.
//

import Foundation
@testable import CombineLocationManager

struct SystemBeaconRegionStub: SystemBeaconRegion {
    
    typealias Constraint = SystemBeaconIdentityConstraintStub
    
    var identifier: String
    
    var uuid: UUID
    
    var beaconIdentityConstraintDataModel: SystemBeaconIdentityConstraintStub
    
    var notifyOnEntry: Bool
    
    var notifyOnExit: Bool
    
    init(
        identifier: String,
        uuid: UUID,
        beaconIdentityConstraintDataModel: SystemBeaconIdentityConstraintStub,
        notifyOnEntry: Bool,
        notifyOnExit: Bool
    ) {
        self.identifier = identifier
        self.uuid = uuid
        self.beaconIdentityConstraintDataModel = beaconIdentityConstraintDataModel
        self.notifyOnEntry = notifyOnEntry
        self.notifyOnExit = notifyOnExit
    }
    
}

// swiftlint: disable force_unwrapping
extension SystemBeaconRegionStub: Stubbable {
    
    static func stub() -> SystemBeaconRegionStub {
        let uuid = UUID(uuidString: "308b7f82-a701-11ed-afa1-0242ac120002")!
        return .init(
            identifier: "id",
            uuid: uuid,
            beaconIdentityConstraintDataModel: SystemBeaconIdentityConstraintStub(uuid: uuid),
            notifyOnEntry: true,
            notifyOnExit: true
        )
    }
}
// swiftlint: enable force_unwrapping
