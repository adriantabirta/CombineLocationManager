//
//  Stubbable.swift
//  
//
//  Created by at on 24.07.2023.
//

protocol Stubbable {
    
    static func stub() -> Self
}

extension Stubbable {
    
    func setting<T>(_ keyPath: WritableKeyPath<Self, T>,
                    to value: T) -> Self {
        var stub = self
        stub[keyPath: keyPath] = value
        return stub
    }
}
