//
//  CLLocationToSystemLocationMapper.swift
//  
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import CoreLocation

struct CLLocationToSystemLocationMapper {
    
    func map<T: SystemLocation>(model: [CLLocation]) -> [T] where T.Coordinate: SystemCoordinate {
        model.map {
            T(
                coordinate: .init(
                    latitude: $0.coordinate.latitude,
                    longitude: $0.coordinate.longitude
                ),
                horizontalAccuracy: $0.horizontalAccuracy,
                direction: $0.course,
                timestamp: $0.timestamp
            )
        }
    }
}
