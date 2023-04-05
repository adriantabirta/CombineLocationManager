//
//  RealSystemStopUpdatingLocationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 27.03.2023.
//

public struct RealSystemStopUpdatingLocationUseCase {
    
    // MARK: - Properties
    
    private let locationManager: LocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStopUpdatingLocationUseCase

extension RealSystemStopUpdatingLocationUseCase: SystemStopUpdatingLocationUseCase {
    
    public func execute() {
        locationManager.stopUpdatingLocation()
    }
}
