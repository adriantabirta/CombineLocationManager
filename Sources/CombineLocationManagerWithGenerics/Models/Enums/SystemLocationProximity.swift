//
//  SystemLocationProximity.swift
//
//
//  Created by at-plan-net on 28.02.2023.
//

public enum SystemLocationProximity: Int {
    
    case unknown = 0
    
    case immediate = 1
    
    case near = 2
    
    case far = 3
}

// MARK: - CustomStringConvertible

extension SystemLocationProximity: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .unknown: return "unknown"
        case .immediate: return "immediate"
        case .near: return "near"
        case .far: return "far"
        }
    }
}
