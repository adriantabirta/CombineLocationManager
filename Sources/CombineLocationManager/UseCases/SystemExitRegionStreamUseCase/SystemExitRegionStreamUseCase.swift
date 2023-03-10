//
//  SystemExitRegionStreamUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 02.02.2023.
//

import Combine

public protocol SystemExitRegionStreamUseCase {
    
    func execute() -> AnyPublisher<SystemRegion, Never>
}
