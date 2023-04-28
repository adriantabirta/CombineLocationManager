//
//  SystemGetCurrentLocationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 28.04.2023.
//

import Combine

public protocol SystemGetCurrentLocationUseCase {
    
    func execute() -> AnyPublisher<SystemLocation, Error>
}
