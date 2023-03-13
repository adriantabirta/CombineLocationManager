//
//  SystemDidDetermineStateForRegionUseCase.swift
//
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import Combine

public protocol SystemDidDetermineStateForRegionUseCase {
    
    func execute() -> AnyPublisher<(SystemRegionState, SystemRegion), Never>
}
