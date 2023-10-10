//
//  SystemLocation.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

import Foundation

public protocol SystemLocation: Equatable {
    
    associatedtype Coordinate
    
    // MARK: - Properties
    
    var coordinate: Coordinate { get }
    
    var horizontalAccuracy: Double { get }
    
    var direction: Double { get }
    
    var timestamp: Date { get }
    
    // MARK: - Methods
    
    init()
    
    init(coordinate: Coordinate, horizontalAccuracy: Double, direction: Double, timestamp: Date)
}
