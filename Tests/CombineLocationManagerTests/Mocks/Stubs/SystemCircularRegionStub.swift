//
//  SystemCircularRegionStub.swift
//
//
//  Created by at on 01.03.2023.
//

@testable import CombineLocationManager

struct SystemCircularRegionStub: SystemCircularRegion {
    
    var identifier: String
    
    var coordinate: CombineLocationManager.SystemCoordinate
    
    var radius: Double
    
    var notifyOnEntry: Bool
    
    var notifyOnExit: Bool
    
    init(identifier: String, coordinate: CombineLocationManager.SystemCoordinate, radius: Double, notifyOnEntry: Bool, notifyOnExit: Bool) {
        self.identifier = identifier
        self.coordinate = coordinate
        self.radius = radius
        self.notifyOnEntry = notifyOnEntry
        self.notifyOnExit = notifyOnExit
    }
}

extension SystemCircularRegionStub: Stubbable {
    
    static func stub() -> SystemCircularRegionStub {
        .init(
            identifier: "1",
            coordinate: SystemCoordinateStub.stub(),
            radius: 200,
            notifyOnEntry: true,
            notifyOnExit: true
        )
    }
}
