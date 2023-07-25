//
//  LocationDataModel.swift
//
//
//  Created by at-plan-net on 28.02.2023.
//

public struct SystemLocation: Codable, Equatable {
    
    // MARK: - Properties
    
    public let coordinate: SystemCoordinate
    
    // Range: 0.0 - 359.9 degrees, 0 being true North
    public let direction: Double
    
    // MARK: - Init
    
    init(coordinate: SystemCoordinate, direction: Double) {
        self.coordinate = coordinate
        self.direction = direction
    }
}
