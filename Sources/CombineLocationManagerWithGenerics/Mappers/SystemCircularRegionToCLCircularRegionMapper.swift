//
//  File.swift
//  
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import CoreLocation

struct SystemCircularRegionToCLCircularRegionMapper {
    
    func map(from model: SystemCircularRegion) -> CLCircularRegion {
        .init(
            center: .init(
                latitude: model.coordinate.latitude,
                longitude: model.coordinate.longitude
            ),
            radius: model.radius,
            identifier: model.identifier
        )
    }
}
