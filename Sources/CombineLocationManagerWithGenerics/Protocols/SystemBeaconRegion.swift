//
//  SystemBeaconRegion.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

import Foundation

public protocol SystemBeaconRegion: SystemGenericRegion {
    
    // MARK: - Properties
    
    var identifier: String { get }
    
    var uuid: UUID { get }
    
    var beaconIdentityConstraintDataModel: SystemBeaconIdentityConstraint { get }
    
    // MARK: - Methods
    
    init(
        identifier: String, uuid: UUID,
        beaconIdentityConstraintDataModel: SystemBeaconIdentityConstraint, notifyOnEntry: Bool, notifyOnExit: Bool
    )
}
