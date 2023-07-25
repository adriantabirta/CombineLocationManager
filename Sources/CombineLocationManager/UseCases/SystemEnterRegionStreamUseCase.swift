//
//  SystemEnterRegionStreamUseCase.swift
// 
//
//  Created by at-plan-net on 02.02.2023.
//

import Combine

public protocol SystemEnterRegionStreamUseCase {
    
    func execute() -> AnyPublisher<SystemRegion, Never>
}

public struct RealSystemEnterRegionStreamUseCase {
    
    // MARK: - Dependencies
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemEnterRegionStreamUseCase

extension RealSystemEnterRegionStreamUseCase: SystemEnterRegionStreamUseCase {
    
    public func execute() -> AnyPublisher<SystemRegion, Never> {
        locationManagerDelegate.enterRegionStream
    }
}
