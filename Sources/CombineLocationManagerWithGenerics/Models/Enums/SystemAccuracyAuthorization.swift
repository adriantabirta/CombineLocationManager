//
//  SystemAccuracyAuthorization.swift
//  
//
//  Created by Adrian Tabirta on 28.07.2023.
//

public enum SystemAccuracyAuthorization: Int {
    
    case fullAccuracy = 0
    
    case reducedAccuracy = 1
}

// MARK: - CustomStringConvertible

extension SystemAccuracyAuthorization: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .fullAccuracy: return "fullAccuracy"
        case .reducedAccuracy: return "reducedAccuracy"
        }
    }
}
