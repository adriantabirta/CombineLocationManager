//
//  LocationAuthorizationStatus.swift
//
//
//  Created by at-plan-net on 28.02.2023.
//

public enum SystemLocationAuthorizationStatus: Int32 {
    
    case notDetermined = 0
    
    case restricted = 1
    
    case denied = 2
    
    case authorizedAlways = 3
    
    case authorizedWhenInUse = 4
}
