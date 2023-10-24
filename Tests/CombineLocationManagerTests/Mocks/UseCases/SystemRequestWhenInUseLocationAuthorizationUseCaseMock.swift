//
//  SystemRequestWhenInUseLocationAuthorizationUseCaseMock.swift
//
//
//  Created by at on 01.03.2023.
//

@testable import CombineLocationManager

class SystemRequestWhenInUseLocationAuthorizationUseCaseMock: SystemRequestWhenInUseLocationAuthorizationUseCase {

    var invokedExecute = false
    var invokedExecuteCount = 0

    func execute() {
        invokedExecute = true
        invokedExecuteCount += 1
    }
}
