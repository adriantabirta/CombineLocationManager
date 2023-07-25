//
//  SystemBeacon.swift
// 
//
//  Created by at-plan-net on 02.03.2023.
//

import Foundation

public struct SystemBeacon: Equatable {
    
    public let uuid: UUID
    
    public let major: NSNumber
    
    public let minor: NSNumber
    
    public let proximity: SystemLocationProximity
    
    public let accuracy: Double
    
    public let rssi: Int
    
    public let beaconIdentityConstraint: SystemBeaconIdentityConstraint
    
    // MARK: - Init
    
    public init(
        uuid: UUID,
        major: NSNumber,
        minor: NSNumber,
        proximity: SystemLocationProximity,
        accuracy: Double,
        rssi: Int,
        beaconIdentityConstraint: SystemBeaconIdentityConstraint
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

// MARK: - CustomStringConvertible

extension SystemBeacon: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(major)
        hasher.combine(minor)
    }
}

// MARK: - CustomStringConvertible

extension SystemBeacon: CustomStringConvertible {
    
    public var description: String {
        """
        BeaconDataModel(uuid: \(uuid.uuidString), major: \(major.description), \
        minor: \(minor.description), proximity: \(proximity.description), accuracy: \(accuracy.description), rssi:\(rssi))
        """
    }
}
