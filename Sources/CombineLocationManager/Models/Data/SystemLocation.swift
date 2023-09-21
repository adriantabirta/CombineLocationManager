//
//  LocationDataModel.swift
//
//
//  Created by at-plan-net on 28.02.2023.
//

import Foundation

public struct SystemLocation: Codable, Equatable {
    
    // MARK: - Properties
    
    public let coordinate: SystemCoordinate
    
    // Range: 0.0 - 359.9 degrees, 0 being true North
    public let direction: Double
    
    public var timestamp: Date
    
    // MARK: - Init
    
    public init(coordinate: SystemCoordinate, direction: Double, timestamp: Date) {
        self.coordinate = coordinate
        self.direction = direction
        self.timestamp = timestamp
    }
}
