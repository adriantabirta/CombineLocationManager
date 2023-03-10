//
//  RegionProtocol.swift
//  MyLoyalty
//
//  Created by at-plan-net on 01.03.2023.
//

public protocol RegionProtocol {
    
    var identifier: String { get }
    
    var notifyOnEntry: Bool { get set }
    
    var notifyOnExit: Bool { get set }
}
