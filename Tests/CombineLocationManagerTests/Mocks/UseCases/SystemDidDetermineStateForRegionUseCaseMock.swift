//
//  SystemDidDetermineStateForRegionUseCaseMock.swift
//
//
//  Created by at-plan-net on 10.03.2023.
//

import Combine
@testable import CombineLocationManager

class SystemDidDetermineStateForRegionUseCaseMock: SystemDidDetermineStateForRegionUseCase {

    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteResult: AnyPublisher<(SystemRegionState, SystemRegion), Never>!

    func execute() -> AnyPublisher<(SystemRegionState, SystemRegion), Never> {
        invokedExecute = true
        invokedExecuteCount += 1
        return stubbedExecuteResult
    }
}
