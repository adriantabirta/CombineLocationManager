//
//  SystemGetLocationAuthorizationStatusUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 01.03.2023.
//

import Combine

public protocol SystemGetLocationAuthorizationStatusUseCase {
    
    func execute() -> AnyPublisher<SystemLocationAuthorizationStatus, Never>
}
