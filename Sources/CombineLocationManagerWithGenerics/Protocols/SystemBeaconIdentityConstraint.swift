//
//  SystemBeaconIdentityConstraint.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

import Foundation

public protocol SystemBeaconIdentityConstraint {
    
    // MARK: - Properties
    
    var uuid: UUID { get }
    
    // MARK: - Methods
    
    init(uuid: UUID)
}
