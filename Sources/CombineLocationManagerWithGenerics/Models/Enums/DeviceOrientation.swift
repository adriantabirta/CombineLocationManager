//
//  DeviceOrientation.swift
//  
//
//  Created by Adrian Tabirta on 28.07.2023.
//

public enum DeviceOrientation: Int32 {
    
    case unknown = 0

    case portrait = 1

    case portraitUpsideDown = 2

    case landscapeLeft = 3

    case landscapeRight = 4

    case faceUp = 5

    case faceDown = 6
}

// MARK: - CustomStringConvertible

extension DeviceOrientation: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .unknown: return "unknown"
        case .portrait: return "portrait"
        case .portraitUpsideDown: return "portraitUpsideDown"
        case .landscapeLeft: return "landscapeLeft"
        case .landscapeRight: return "landscapeRight"
        case .faceUp: return "faceUp"
        case .faceDown: return "faceDown"
        }
    }
}
