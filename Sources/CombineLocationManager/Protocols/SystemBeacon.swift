//
//  SystemBeacon.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

import Foundation

public protocol SystemBeacon {
    
    associatedtype Constraint
    
    // MARK: - Properties
    
    var uuid: UUID { get }
    
    var major: NSNumber { get }
    
    var minor: NSNumber { get }
    
    var proximity: SystemLocationProximity { get }
    
    var accuracy: Double { get }
    
    var rssi: Int { get }
    
    var beaconIdentityConstraint: Constraint { get }
    
    // MARK: - Methods
    
    init(
        uuid: UUID,
        major: NSNumber,
        minor: NSNumber,
        proximity: SystemLocationProximity,
        accuracy: Double,
        rssi: Int,
        beaconIdentityConstraint: Constraint
    )
}
