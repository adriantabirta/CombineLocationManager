//
//  SystemCoordinateStub.swift
//
//
//  Created by at on 01.03.2023.
//

@testable import CombineLocationManager

struct SystemCoordinateStub: SystemCoordinate, Equatable {
    
    private(set) var latitude: Double
    
    private(set) var longitude: Double
    
    init() {
        latitude = .zero
        longitude = .zero
    }
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension SystemCoordinateStub: Stubbable {
    
    static func stub() -> SystemCoordinateStub {
        .init(latitude: 1.1, longitude: 2.2)
    }
}
