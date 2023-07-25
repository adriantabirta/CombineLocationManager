//
//  SystemCircularRegionStub.swift
//
//
//  Created by at-plan-net on 01.03.2023.
//

@testable import CombineLocationManager

extension SystemCircularRegion: Stubbable {
    
    static func stub() -> SystemCircularRegion {
        .init(
            identifier: "1",
            coordinate: SystemCoordinate.stub(),
            radius: 200,
            notifyOnEntry: true,
            notifyOnExit: true
        )
    }
}
