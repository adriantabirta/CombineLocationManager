//
//  SystemStopUpdatingLocationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 27.03.2023.
//

public protocol SystemStopUpdatingLocationUseCase {
    
    func execute()
}

public struct RealSystemStopUpdatingLocationUseCase {
    
    // MARK: - Properties
    
    private let locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStopUpdatingLocationUseCase

extension RealSystemStopUpdatingLocationUseCase: SystemStopUpdatingLocationUseCase {
    
    public func execute() {
        locationManager.stopUpdatingLocation()
    }
}
