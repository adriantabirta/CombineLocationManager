//
//  CircularRegionDataModel.swift
//  MyLoyalty
//
//  Created by at-plan-net on 28.02.2023.
//

public struct SystemCircularRegion: RegionProtocol {
    
    // MARK: - Properties
    
    public var identifier: String
    
    public var coordinate: SystemCoordinate
    
    public var radius: Double
    
    public var notifyOnEntry: Bool
    
    public var notifyOnExit: Bool
    
    // MARK: - Init
    
    init(identifier: String, coordinate: SystemCoordinate, radius: Double, notifyOnEntry: Bool, notifyOnExit: Bool) {
        self.identifier = identifier
        self.coordinate = coordinate
        self.radius = radius
        self.notifyOnEntry = notifyOnEntry
        self.notifyOnExit = notifyOnExit
    }
}
