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
    
    func getLocationsStream<T: SystemLocation>() -> AnyPublisher<[T], Error> where T.Coordinate: SystemCoordinate
    
    func didUpdateHeadingStream<T: SystemHeading>() -> AnyPublisher<T, Never>
    
    func getEnterRegionStream<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint
    
    func getExitRegionStream<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint
    
    func didRangeBeacons<T: SystemBeacon>() -> AnyPublisher<[T], Error> where T.Constraint : SystemBeaconIdentityConstraint
    
    func didDetermineStateForRegion<T: SystemRegion>() -> AnyPublisher<(SystemRegionState, T), Never> where T.Constraint: SystemBeaconIdentityConstraint
    
    var didChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never> { get }
    
    var didFailWithError: AnyPublisher<Error, Never> { get }
}
