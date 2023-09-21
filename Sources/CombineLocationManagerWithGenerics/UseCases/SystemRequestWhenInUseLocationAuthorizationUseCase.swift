//
//  SystemRequestWhenInUseLocationAuthorizationUseCase.swift
//
//
//  Created by at-plan-net on 01.03.2023.
//

public protocol SystemRequestWhenInUseLocationAuthorizationUseCase {
    
    func execute()
}

public struct RealSystemRequestWhenInUseLocationAuthorizationUseCase {
    
    // MARK: - Properties
    
    private var locationManager: SystemLocationManager
    
    // MARK: - Init
    
    public init(_ locationManager: SystemLocationManager) {
        self.locationManager = locationManager
    }
}

// MARK: - SystemRequestWhenInUseLocationAuthorizationUseCase implementation

extension RealSystemRequestWhenInUseLocationAuthorizationUseCase: SystemRequestWhenInUseLocationAuthorizationUseCase {
    
    public func execute() {
        locationManager.requestWhenInUseAuthorization()
    }
}
