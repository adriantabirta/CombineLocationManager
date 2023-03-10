//
//  LocationDataModel.swift
//  MyLoyalty
//
//  Created by at-plan-net on 28.02.2023.
//

public struct SystemLocation: Codable, Equatable {
    
    // MARK: - Properties
    
    public let coordinate: SystemCoordinate
    
    // MARK: - Init
    
    init(coordinate: SystemCoordinate) {
        self.coordinate = coordinate
    }
}
