//
//  SystemBeaconStub.swift
//
//
//  Created by at on 02.03.2023.
//

import Foundation
@testable import CombineLocationManager

struct SystemBeaconStub: SystemBeacon, Equatable {
    
    typealias Constraint = SystemBeaconIdentityConstraintStub
    
    var uuid: UUID
    
    var major: NSNumber
    
    var minor: NSNumber
    
    var proximity: CombineLocationManager.SystemLocationProximity
    
    var accuracy: Double
    
    var rssi: Int
    
    var beaconIdentityConstraint: SystemBeaconIdentityConstraintStub
    
    init(
        uuid: UUID,
        major: NSNumber,
        minor: NSNumber,
        proximity: CombineLocationManager.SystemLocationProximity,
        accuracy: Double,
        rssi: Int,
        beaconIdentityConstraint: Constraint
    ) {
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.proximity = proximity
        self.accuracy = accuracy
        self.rssi = rssi
        self.beaconIdentityConstraint = beaconIdentityConstraint
    }
}

// MARK: - Hashable

extension SystemBeaconStub: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(major)
        hasher.combine(minor)
    }
}

// MARK: - CustomStringConvertible

extension SystemBeaconStub {
    
    var description: String {
        """
        BeaconDataModel(uuid: \(uuid.uuidString), major: \(major.description), \
        minor: \(minor.description), proximity: \(proximity.description), accuracy: \(accuracy.description), rssi:\(rssi))
        """
    }
}

// swiftlint: disable force_unwrapping
extension SystemBeaconStub: Stubbable {
    
    static func stub() -> SystemBeaconStub {
        .init(
            uuid: .init(uuidString: "308b7f82-a701-11ed-afa1-0242ac120002")!,
            major: 1,
            minor: 1,
            proximity: .near,
            accuracy: 0.5,
            rssi: 50,
            beaconIdentityConstraint: .init(uuid: .init(uuidString: "308b7f82-a701-11ed-afa1-0242ac120002")!)
        )
    }
}
// swiftlint: enable force_unwrapping
