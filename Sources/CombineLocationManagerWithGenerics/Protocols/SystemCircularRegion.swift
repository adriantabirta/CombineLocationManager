//
//  SystemCircularRegion.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

import Foundation

public protocol SystemCircularRegion: SystemGenericRegion {
    
    // MARK: - Properties
    
    var identifier: String { get }
    
    var coordinate: SystemCoordinate { get }
    
    var radius: Double { get }
    
    // MARK: - Methods
    
    init(identifier: String, coordinate: SystemCoordinate, radius: Double, notifyOnEntry: Bool, notifyOnExit: Bool)
}
