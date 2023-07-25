//
//  SystemGetLocationAuthorizationStatusUseCaseMock.swift
//
//
//  Created by at-plan-net on 01.03.2023.
//

import Combine
@testable import CombineLocationManager

class SystemGetLocationAuthorizationStatusUseCaseMock: SystemGetLocationAuthorizationStatusUseCase {

    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteResult: AnyPublisher<SystemLocationAuthorizationStatus, Never>!

    func execute() -> AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        invokedExecute = true
        invokedExecuteCount += 1
        return stubbedExecuteResult
    }
}
