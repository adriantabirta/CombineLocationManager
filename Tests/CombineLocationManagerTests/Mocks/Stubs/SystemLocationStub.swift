//
//  SystemLocationStub.swift
//
//
//  Created by at on 02.03.2023.
//

import Foundation
@testable import CombineLocationManager

struct SystemLocationStub: SystemLocation, Equatable {
    
    typealias Coordinate = SystemCoordinateStub
    
    var horizontalAccuracy: Double
    
    var direction: Double
    
    var timestamp: Date
    
    var coordinate: SystemCoordinateStub
    
    init() {
        self.horizontalAccuracy = .zero
        self.direction = .zero
        self.timestamp = .init()
        self.coordinate = .init()
    }
    
    init(coordinate: SystemCoordinateStub, horizontalAccuracy: Double, direction: Double, timestamp: Date) {
        self.horizontalAccuracy = horizontalAccuracy
        self.direction = direction
        self.timestamp = timestamp
        self.coordinate = coordinate
    }
}

extension SystemLocationStub: Stubbable {
    
    static func stub() -> SystemLocationStub {
        .init(
            coordinate: .stub(),
            horizontalAccuracy: 1,
            direction: 1,
            timestamp: Date()
        )
    }
}
