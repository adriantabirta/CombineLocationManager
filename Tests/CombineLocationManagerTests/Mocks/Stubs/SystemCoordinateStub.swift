//
//  SystemCoordinateStub.swift
//
//
//  Created by at-plan-net on 01.03.2023.
//

@testable import CombineLocationManager

extension SystemCoordinate: Stubbable {
    
    static func stub() -> SystemCoordinate {
        .init(
            latitude: 1.1,
            longitude: 2.2
        )
    }
}
