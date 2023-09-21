//
//  SystemRegion.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

public protocol SystemRegion: Hashable {
    
    associatedtype Constraint
    
    var identifier: String { get }
    
    var notifyOnEntry: Bool { get }
    
    var notifyOnExit: Bool { get }
    
    var systemBeaconIdentityConstraint: Constraint? { get }
    
    init(identifier: String, notifyOnEntry: Bool, notifyOnExit: Bool, systemBeaconIdentityConstraint: Constraint?)
}
