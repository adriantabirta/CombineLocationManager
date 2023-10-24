//
//  SystemGenericRegion.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

public protocol SystemGenericRegion {
    
    var identifier: String { get }
    
    var notifyOnEntry: Bool { get set }
    
    var notifyOnExit: Bool { get set }
}
