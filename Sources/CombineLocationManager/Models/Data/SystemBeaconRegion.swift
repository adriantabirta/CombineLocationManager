//
//  SystemBeaconRegion.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

import Foundation

public struct SystemBeaconRegion: RegionProtocol {    
    
    // MARK: - Properties
    
    public var identifier: String
    
    public var uuid: UUID
    
    public var beaconIdentityConstraintDataModel: SystemBeaconIdentityConstraint
    
    public var notifyOnEntry: Bool
    
    public var notifyOnExit: Bool
    
    // MARK: - Init
    
    public init(identifier: String, uuid: UUID, beaconIdentityConstraintDataModel: SystemBeaconIdentityConstraint, notifyOnEntry: Bool, notifyOnExit: Bool) {
        self.identifier = identifier
        self.uuid = uuid
        self.beaconIdentityConstraintDataModel = beaconIdentityConstraintDataModel
        self.notifyOnEntry = notifyOnEntry
        self.notifyOnExit = notifyOnExit
    }
}
