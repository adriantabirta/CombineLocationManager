//
//  SystemDidDetermineStateForRegionUseCaseMock.swift
//
//
//  Created by at on 10.03.2023.
//

import Combine
@testable import CombineLocationManager

class SystemDidDetermineStateForRegionUseCaseMock: SystemDidDetermineStateForRegionUseCase {

    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteResult: AnyPublisher<(SystemRegionState, Any), Never>!

    func execute<T: SystemRegion>() -> AnyPublisher<(SystemRegionState, T), Never> where T.Constraint: SystemBeaconIdentityConstraint {
        invokedExecute = true
        invokedExecuteCount += 1
        return stubbedExecuteResult.compactMap { $0 as? (SystemRegionState, T) }.eraseToAnyPublisher()
    }
}
