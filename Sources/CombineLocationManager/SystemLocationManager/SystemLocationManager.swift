//
//  SystemLocationManager.swift
//
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import Combine

public protocol SystemLocationManager {
    
    // MARK: - Properties
    
    var lastLocation: SystemLocation? { get }
    
    var currentMonitoredRegions: Set<SystemRegion> { get }
    
    var currentAuthorizationStatus: SystemLocationAuthorizationStatus { get }
    
    @available(iOS 14.0, *)
    var systemAccuracyAuthorization: SystemAccuracyAuthorization { get }
    
    var currentHeadingOrientation: DeviceOrientation { get }
    
    // MARK: - Methods
    
    init(_ locationManagerDelegate: LocationManagerDelegate)
    
    func requestWhenInUseAuthorization()
    
    func requestAlwaysAuthorization()
    
    @available(iOS 14.0, *)
    func requestTemporaryFullAccuracyAuthorization(withPurposeKey purposeKey: String)
    
    func requestLocation()
    
    func startUpdatingLocation()
    
    func stopUpdatingLocation()
    
    func startUpdatingHeading()
    
    func stopUpdatingHeading()
    
    func dismissHeadingCalibrationDisplay()
    
    func startMonitoring(for region: RegionProtocol)
    
    func stopMonitoring(for region: RegionProtocol)
    
    func startRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint)
    
    func stopRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint)
    
    // MARK: - Delegate Streams
    
    var locationsStream: AnyPublisher<[SystemLocation], Error> { get }
    
    var enterRegionStream: AnyPublisher<SystemRegion, Never> { get }
    
    var exitRegionStream: AnyPublisher<SystemRegion, Never> { get }
    
    var didRangeBeacons: AnyPublisher<[SystemBeacon], Error> { get }
    
    var didDetermineStateForRegion: AnyPublisher<(SystemRegionState, SystemRegion), Never> { get }
    
    var didChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never> { get }
}
