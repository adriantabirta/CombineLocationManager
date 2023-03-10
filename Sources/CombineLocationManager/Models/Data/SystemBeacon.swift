//
//  SystemBeacon.swift
//  MyLoyalty
//
//  Created by at-plan-net on 02.03.2023.
//

import Foundation

public struct SystemBeacon: Equatable {
    
    let uuid: UUID
    
    let major: NSNumber
    
    let minor: NSNumber
    
    let proximity: SystemLocationProximity
    
    let accuracy: Double
    
    let rssi: Int
    
    let beaconIdentityConstraint: SystemBeaconIdentityConstraint
    
    // MARK: - Init
    
    public init(uuid: UUID, major: NSNumber, minor: NSNumber, proximity: SystemLocationProximity, accuracy: Double, rssi: Int, beaconIdentityConstraint: SystemBeaconIdentityConstraint) {
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.proximity = proximity
        self.accuracy = accuracy
        self.rssi = rssi
        self.beaconIdentityConstraint = beaconIdentityConstraint
    }
}

// MARK: - CustomStringConvertible

extension SystemBeacon: CustomStringConvertible {
    
    public var description: String {
        """
        BeaconDataModel(uuid: \(uuid.uuidString), major: \(major.description),\
        minor: \(minor.description), proximity: \(proximity.description), accuracy: \(accuracy.description),  rssi:\(rssi))
        """
    }
}
