//
//  SystemGetLastLocationUseCaseMock.swift
//
//
//  Created by at on 01.03.2023.
//

import Combine
@testable import CombineLocationManager

class SystemGetLastLocationUseCaseMock: SystemGetLastLocationUseCase {

    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteResult: AnyPublisher<Any?, Never>!

    func execute<T: SystemLocation>() -> AnyPublisher<T?, Never> where T.Coordinate: SystemCoordinate {
        invokedExecute = true
        invokedExecuteCount += 1
        return stubbedExecuteResult.compactMap { $0 as? T }.eraseToAnyPublisher()
    }
}
