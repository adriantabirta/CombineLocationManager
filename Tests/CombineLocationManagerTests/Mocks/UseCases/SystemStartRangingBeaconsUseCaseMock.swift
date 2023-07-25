//
//  SystemStartRangingBeaconsUseCaseMock.swift
//
//
//  Created by at-plan-net on 10.03.2023.
//

@testable import CombineLocationManager

class SystemStartRangingBeaconsUseCaseMock: SystemStartRangingBeaconsUseCase {

    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: (constraint: SystemBeaconIdentityConstraint, Void)?
    var invokedExecuteParametersList = [(constraint: SystemBeaconIdentityConstraint, Void)]()

    func execute(_ constraint: SystemBeaconIdentityConstraint) {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = (constraint, ())
        invokedExecuteParametersList.append((constraint, ()))
    }
}
