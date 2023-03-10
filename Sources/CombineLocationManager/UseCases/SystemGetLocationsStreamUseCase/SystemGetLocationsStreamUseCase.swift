//
//  SystemGetLocationsStreamUseCase.swift
//  LocationManagerCombineImplementation
//
//  Created by at-plan-net on 27.02.2023.
//

import Combine
import CoreLocation

public protocol SystemGetLocationsStreamUseCase {
    
    func execute() -> AnyPublisher<[SystemLocation], Never>
}
