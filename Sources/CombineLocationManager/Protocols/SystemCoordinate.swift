//
//  SystemCoordinate.swift
//  
//
//  Created by Adrian Tabirta on 21.09.2023.
//

public protocol SystemCoordinate {
    
    // MARK: - Properties

    var latitude: Double { get }
    
    var longitude: Double { get }
    
    // MARK: - Methods
    
    init()
    
    init(latitude: Double, longitude: Double)
}
