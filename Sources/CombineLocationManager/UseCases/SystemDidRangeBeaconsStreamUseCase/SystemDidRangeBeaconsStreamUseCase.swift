//
//  SystemDidRangeBeaconsStreamUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 03.02.2023.
//

import Combine
import CoreLocation

public protocol SystemDidRangeBeaconsStreamUseCase {
    
    func execute() -> AnyPublisher<[SystemBeacon], Error>
}
