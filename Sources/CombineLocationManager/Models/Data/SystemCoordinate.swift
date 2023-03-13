//
//  CoordinateDataModel.swift
//  MyLoyalty
//
//  Created by at-plan-net on 28.02.2023.
//

public struct SystemCoordinate: Codable, Equatable {
    
    // MARK: - Properties
    
    public let latitude: Double
    
    public let longitude: Double
    
    // MARK: - Init
    
    public init() {
        self.latitude = -1
        self.longitude = -1
    }
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
