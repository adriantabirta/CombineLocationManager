//
//  SystemGetLastLocationUseCaseMock.swift
//
//
//  Created by at-plan-net on 01.03.2023.
//

import Combine
@testable import CombineLocationManager

class SystemGetLastLocationUseCaseMock: SystemGetLastLocationUseCase {

    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteResult: AnyPublisher<SystemLocation?, Never>!

    func execute() -> AnyPublisher<SystemLocation?, Never> {
        invokedExecute = true
        invokedExecuteCount += 1
        return stubbedExecuteResult
    }
}
