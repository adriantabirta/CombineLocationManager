//
//  RealSystemStartUpdatingLocationUseCase.swift
//  
//
//  Created by Adrian Tabirta on 27.03.2023.
//

struct RealSystemStartUpdatingLocationUseCase {
    
    // MARK: - Properties
    
    private let locationManager: LocationManager
    
    // MARK: - Init
    
    public init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemStartUpdatingLocationUseCase

extension RealSystemStartUpdatingLocationUseCase: SystemStartUpdatingLocationUseCase {
    
    func execute() {
        locationManager.startUpdatingLocation()        
    }
}
