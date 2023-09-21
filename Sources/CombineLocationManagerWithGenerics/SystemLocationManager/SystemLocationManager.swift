//
//  SystemLocationManager.swift
//
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import Combine

public protocol SystemLocationManager {
    
    // MARK: - Properties
    
    func getLastLocation<T: SystemLocation>() -> T? where T.Coordinate: SystemCoordinate
        
    func getCurrentMonitoredRegions<T: SystemRegion>() -> [T]
    
    var currentAuthorizationStatus: SystemLocationAuthorizationStatus { get }
    
    @available(iOS 14.0, *)
    var currentAccuracyAuthorization: SystemAccuracyAuthorization { get }
    
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
    
    func startMonitoring<T: SystemGenericRegion>(for region: T)
    
    func stopMonitoring<T: SystemGenericRegion>(for region: T)
    
    func startRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint)
    
    func stopRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint)
    
    // MARK: - Delegate Streams
    
    func getLocationsStream<T: SystemLocation>() -> AnyPublisher<[T], Error> where T.Coordinate: SystemCoordinate
    
    func didUpdateHeadingStream<T: SystemHeading>() -> AnyPublisher<T, Never>
    
    func enterRegionStream<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint
    
    func exitRegionStream<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint
    
    func didRangeBeacons<T: SystemBeacon>() -> AnyPublisher<[T], Error> where T.Constraint: SystemBeaconIdentityConstraint
    
    func didDetermineStateForRegion<T: SystemRegion>() -> AnyPublisher<(SystemRegionState, T), Never> where T.Constraint: SystemBeaconIdentityConstraint
    
    var didChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never> { get }
    
    var didFailWithError: AnyPublisher<Error, Never> { get }
}
