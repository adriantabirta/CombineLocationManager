//
//  RegionState.swift
//
//
//  Created by at on 28.02.2023.
//

public enum SystemRegionState: Int {
    
    case unknown = 0
    
    case inside = 1
    
    case outside = 2
}

// MARK: - CustomStringConvertible

extension SystemRegionState: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .unknown: return "unknown"
        case .inside: return "inside"
        case .outside: return "outside"
        }
    }
}
