//
//  RealSystemStopUpdatingLocationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 27.03.2023.
//

import Foundation

struct RealSystemStopUpdatingLocationUseCase {
    
    // MARK: - Properties
    
    private let locationManager: LocationManager
    
    // MARK: - Init
    
    public init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStopUpdatingLocationUseCase

extension RealSystemStopUpdatingLocationUseCase: SystemStopUpdatingLocationUseCase {
    
    func execute() {
        locationManager.stopUpdatingLocation()
    }
}
