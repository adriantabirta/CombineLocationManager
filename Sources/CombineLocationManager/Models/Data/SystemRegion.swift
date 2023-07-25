//
//  RegionDataModel.swift
//
//
//  Created by at-plan-net on 28.02.2023.
//

public struct SystemRegion: Hashable {
    
    public let identifier: String
    
    public let notifyOnEntry: Bool
    
    public let notifyOnExit: Bool
    
    public let systemBeaconIdentityConstraint: SystemBeaconIdentityConstraint?
    
    // MARK: - Init
    
    public init(identifier: String, notifyOnEntry: Bool, notifyOnExit: Bool, systemBeaconIdentityConstraint: SystemBeaconIdentityConstraint?) {
        self.identifier = identifier
        self.notifyOnEntry = notifyOnEntry
        self.notifyOnExit = notifyOnExit
        self.systemBeaconIdentityConstraint = systemBeaconIdentityConstraint
    }
}
