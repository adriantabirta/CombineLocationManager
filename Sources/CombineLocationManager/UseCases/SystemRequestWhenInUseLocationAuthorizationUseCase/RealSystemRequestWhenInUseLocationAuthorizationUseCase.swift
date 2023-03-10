//
//  RealSystemRequestWhenInUseLocationAuthorizationUseCase.swift
//  MyLoyalty
//
//  Created by at-plan-net on 01.03.2023.
//

public struct RealSystemRequestWhenInUseLocationAuthorizationUseCase {
    
    // MARK: - Properties
    
    private var locationManager: LocationManager
    
    // MARK: - Init
    
    public init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemRequestWhenInUseLocationAuthorizationUseCase

extension RealSystemRequestWhenInUseLocationAuthorizationUseCase: SystemRequestWhenInUseLocationAuthorizationUseCase {
    
    public func execute() {
        locationManager.requestWhenInUseAuthorization()
    }
}
