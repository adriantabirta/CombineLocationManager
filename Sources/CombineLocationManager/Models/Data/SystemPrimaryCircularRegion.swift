//
//  SystemPrimaryCircularRegion.swift
//  MyLoyalty
//
//  Created by at-plan-net on 07.03.2023.
//

public struct SystemPrimaryCircularRegion {
    
    public static let identifier = "kPrimaryRegionIdentifier"
    
    public static let radius: Double = 20_000
    
    public let identifier: String
    
    public let center: SystemCoordinate
    
    public let radius: Double
    
    public init(_ systemCoordinate: SystemCoordinate) {
        self.identifier = SystemPrimaryCircularRegion.identifier
        self.center = systemCoordinate
        self.radius = SystemPrimaryCircularRegion.radius
    }
}
