//
//  SystemEnterRegionStreamUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 02.02.2023.
//

import Combine

public protocol SystemEnterRegionStreamUseCase {
    
     func execute() -> AnyPublisher<SystemRegion, Never>
}
