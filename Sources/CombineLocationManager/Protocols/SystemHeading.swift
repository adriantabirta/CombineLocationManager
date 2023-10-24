//
//  SystemHeading.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

import Foundation

// swiftlint: disable identifier_name
public protocol SystemHeading {
    
    var magneticHeading: Double { get }
    
    var trueHeading: Double { get }
    
    var headingAccuracy: Double { get }
    
    var x: Double { get }
    
    var y: Double { get }
    
    var z: Double { get }
    
    var timestamp: Date { get }
    
    init(magneticHeading: Double, trueHeading: Double, headingAccuracy: Double, x: Double, y: Double, z: Double, timestamp: Date)
}
// swiftlint: enable identifier_name
