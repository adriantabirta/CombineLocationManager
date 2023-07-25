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

public struct RealSystemDidDetermineStateForRegionUseCase {
    
    // MARK: - Dependencies
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemDidDetermineStateForRegionUseCase

extension RealSystemDidDetermineStateForRegionUseCase: SystemDidDetermineStateForRegionUseCase {
    
    public func execute() -> AnyPublisher<(SystemRegionState, SystemRegion), Never> {
        locationManagerDelegate.didDetermineStateForRegion
    }
}