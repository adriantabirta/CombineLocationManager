//
//  CLLocationToSystemLocationMapper.swift
//  
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import CoreLocation

struct CLLocationToSystemLocationMapper {
    
    func map(model: [CLLocation]) -> [SystemLocation] {
        model.map {
            SystemLocation(
                coordinate: SystemCoordinate(
                    latitude: $0.coordinate.latitude,
                    longitude: $0.coordinate.longitude
                )
            )
        }
    }
}
