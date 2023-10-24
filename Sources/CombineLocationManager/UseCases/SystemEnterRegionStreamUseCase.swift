//
//  SystemEnterRegionStreamUseCase.swift
// 
//
//  Created by at on 02.02.2023.
//

import Combine

public protocol SystemEnterRegionStreamUseCase {
    
    func execute<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint
}

public struct RealSystemEnterRegionStreamUseCase {
    
    // MARK: - Dependencies
    
    private let locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
    }
}

// MARK: - SystemEnterRegionStreamUseCase implementation

extension RealSystemEnterRegionStreamUseCase: SystemEnterRegionStreamUseCase {
    
    public func execute<T>() -> AnyPublisher<T, Never> where T: SystemRegion, T.Constraint: SystemBeaconIdentityConstraint {
        locationManagerDelegate.getEnterRegionStream()
    }
}
