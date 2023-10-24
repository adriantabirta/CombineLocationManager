//
//  SystemBeaconRegion.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

import Foundation

public protocol SystemBeaconRegion: SystemGenericRegion {
    
    associatedtype Constraint: SystemBeaconIdentityConstraint
    
    // MARK: - Properties
    
    var identifier: String { get }
    
    var uuid: UUID { get }
    
    var beaconIdentityConstraintDataModel: Constraint { get }
    
    // MARK: - Methods
    
    init(
        identifier: String,
        uuid: UUID,
        beaconIdentityConstraintDataModel: Constraint,
        notifyOnEntry: Bool,
        notifyOnExit: Bool
    )
}
