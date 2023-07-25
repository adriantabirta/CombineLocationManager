//
//  SystemLocationStub.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

@testable import CombineLocationManager

extension SystemLocation: Stubbable {
    
    static func stub() -> SystemLocation {
        .init(
            coordinate: .stub(),
            direction: 1
        )
    }
}
