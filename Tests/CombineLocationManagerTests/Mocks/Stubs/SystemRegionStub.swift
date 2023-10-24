//
//  SystemRegionStub.swift
//
//
//  Created by at on 01.03.2023.
//

@testable import CombineLocationManager

struct SystemRegionStub: SystemRegion {

    typealias Constraint = SystemBeaconIdentityConstraintStub
    
    var identifier: String
    
    var notifyOnEntry: Bool
    
    var notifyOnExit: Bool
    
    var systemBeaconIdentityConstraint: SystemBeaconIdentityConstraintStub?
    
    init(identifier: String, notifyOnEntry: Bool, notifyOnExit: Bool, systemBeaconIdentityConstraint: SystemBeaconIdentityConstraintStub?) {
        self.identifier = identifier
        self.notifyOnEntry = notifyOnEntry
        self.notifyOnExit = notifyOnExit
        self.systemBeaconIdentityConstraint = systemBeaconIdentityConstraint
    }
}

extension SystemRegionStub: Equatable {}

extension SystemRegionStub: Stubbable {
    
    static func stub() -> SystemRegionStub {
        .init(
            identifier: "id",
            notifyOnEntry: true,
            notifyOnExit: true,
            systemBeaconIdentityConstraint: SystemBeaconIdentityConstraintStub.stub()
        )
    }
}
