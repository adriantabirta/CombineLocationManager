//
//  SystemBeaconIdentityConstraint.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

import Foundation

public struct SystemBeaconIdentityConstraint: Hashable {
    
    let uuid: UUID
    
    public init(uuid: UUID) {
        self.uuid = uuid
    }
}
