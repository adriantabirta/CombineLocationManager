//
//  SystemStartUpdatingLocationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 27.03.2023.
//

public protocol SystemStartUpdatingLocationUseCase {
    
    func execute()
}

public struct RealSystemStartUpdatingLocationUseCase {
    
    // MARK: - Properties
    
    private let locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStartUpdatingLocationUseCase implementation

extension RealSystemStartUpdatingLocationUseCase: SystemStartUpdatingLocationUseCase {
    
    public func execute() {
        locationManager.startUpdatingLocation()
    }
}
