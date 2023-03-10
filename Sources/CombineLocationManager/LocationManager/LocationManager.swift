//
//  LocationManager.swift
//
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import Combine

public protocol LocationManager {
    
    // MARK: - Properties
    
    var lastLocation: SystemLocation? { get }
    
    var currentMonitoredRegions: Set<SystemRegion> { get }
    
    var currentAuthorizationStatus: SystemLocationAuthorizationStatus { get }
    
    // MARK: - Methods
    
    init(_ locationManagerDelegate: LocationManagerDelegate)
    
    func requestWhenInUseAuthorization()
    
    func requestAlwaysAuthorization()
    
    func startUpdatingLocation()
    
    func stopUpdatingLocation()
    
    func startMonitoring(for region: RegionProtocol)
    
    func stopMonitoring(for region: RegionProtocol)
    
    func startRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint)
    
    func stopRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint)
    
    // MARK: - Delegate Streams
    
    var locationsStream: AnyPublisher<[SystemLocation], Never> { get }
    
    var enterRegionStream: AnyPublisher<SystemRegion, Never> { get }
    
    var exitRegionStream: AnyPublisher<SystemRegion, Never> { get }
    
    var didRangeBeacons: AnyPublisher<[SystemBeacon], Error> { get }
    
    var didDetermineStateForRegion: AnyPublisher<(SystemRegionState, SystemRegion), Never> { get }
}
