//
//  LocationManagerDelegate.swift
//  LocationManagerCombineImplementation
//
//  Created by at-plan-net on 27.02.2023.
//

import Combine
import CoreLocation

public protocol LocationManagerDelegate: CLLocationManagerDelegate {
    
    // MARK: - Streams
    
    var locationsStream: AnyPublisher<[SystemLocation], Never> { get }
    
    var enterRegionStream: AnyPublisher<SystemRegion, Never> { get }
    
    var exitRegionStream: AnyPublisher<SystemRegion, Never> { get }
    
    var didRangeBeacons: AnyPublisher<[SystemBeacon], Error> { get }
    
    var didDetermineStateForRegion: AnyPublisher<(SystemRegionState, SystemRegion), Never> { get }
}
