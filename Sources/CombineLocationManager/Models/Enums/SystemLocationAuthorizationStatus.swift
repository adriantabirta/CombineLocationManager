//
//  LocationAuthorizationStatus.swift
//
//
//  Created by at on 28.02.2023.
//

public enum SystemLocationAuthorizationStatus: Int32 {
    
    case notDetermined = 0
    
    case restricted = 1
    
    case denied = 2
    
    case authorizedAlways = 3
    
    case authorizedWhenInUse = 4
}

// MARK: - CustomStringConvertible

extension SystemLocationAuthorizationStatus: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .notDetermined: return "notDetermined"
        case .restricted: return "restricted"
        case .denied: return "denied"
        case .authorizedAlways: return "authorizedAlways"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        }
    }
}
