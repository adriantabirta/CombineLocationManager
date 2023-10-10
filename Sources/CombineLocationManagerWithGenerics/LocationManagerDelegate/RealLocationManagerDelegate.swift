//
//  RealLocationManagerDelegate.swift
//
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import Combine
import CoreLocation

public class RealLocationManagerDelegate: NSObject {
    
    // MARK: - Properties
    
    private var locationsSubject: PassthroughSubject<[CLLocation], Error> = .init()
    
    private var didUpdateHeadingSubject: PassthroughSubject<CLHeading, Never> = .init()
    
    private var enterRegionSubject: PassthroughSubject<CLRegion, Never> = .init()
    
    private var exitRegionSubject: PassthroughSubject<CLRegion, Never> = .init()
    
    private var rangeBeaconsSubject: PassthroughSubject<[CLBeacon], Error> = .init()
    
    private var stateForRegionSubject: PassthroughSubject<(CLRegionState, CLRegion), Never> = .init()
    
    private var didChangeAuthorizationSubject: PassthroughSubject<SystemLocationAuthorizationStatus, Never> = .init()
    
    private var didFailWithErrorSubject: PassthroughSubject<Error, Never> = .init()
    
    // MARK: - Init
    
    public override init() {
        super.init()
    }
}

// MARK: - LocationManagerDelegate implementation

extension RealLocationManagerDelegate: LocationManagerDelegate {
    
    public func getLocationsStream<T>() -> AnyPublisher<[T], Error> where T : SystemLocation, T.Coordinate : SystemCoordinate {
        locationsSubject
            .map {
                $0.map {
                    T(
                        coordinate: T.Coordinate(latitude: 0, longitude: 0),
                        horizontalAccuracy: $0.horizontalAccuracy,
                        direction: $0.course,
                        timestamp: $0.timestamp
                    )
                }
            }.eraseToAnyPublisher()
    }
    
    public func didUpdateHeadingStream<T>() -> AnyPublisher<T, Never> where T : SystemHeading {
        didUpdateHeadingSubject
            .map {
                .init(
                    magneticHeading: $0.magneticHeading,
                    trueHeading: $0.trueHeading,
                    headingAccuracy: $0.headingAccuracy,
                    x: $0.x,
                    y: $0.y,
                    z: $0.z,
                    timestamp: $0.timestamp
                )
            }.eraseToAnyPublisher()
    }
    
    public func getEnterRegionStream<T>() -> AnyPublisher<T, Never> where T : SystemRegion, T.Constraint : SystemBeaconIdentityConstraint {
        enterRegionSubject
            .map {
                if let beaconRegion = $0 as? CLBeaconRegion {
                    return .init(
                        identifier: beaconRegion.identifier,
                        notifyOnEntry: beaconRegion.notifyOnEntry,
                        notifyOnExit: beaconRegion.notifyOnExit,
                        systemBeaconIdentityConstraint: .init(uuid: beaconRegion.uuid)
                    )
                } else {
                    return .init(
                        identifier: $0.identifier,
                        notifyOnEntry: $0.notifyOnEntry,
                        notifyOnExit: $0.notifyOnExit,
                        systemBeaconIdentityConstraint: nil
                    )
                }
            }
            .eraseToAnyPublisher()
    }
    
    public func getExitRegionStream<T>() -> AnyPublisher<T, Never> where T : SystemRegion, T.Constraint : SystemBeaconIdentityConstraint {
        enterRegionSubject
            .map { CLRegionToSystemRegionMapper().map(from: $0) }
            .eraseToAnyPublisher()
    }
    
    public func didRangeBeacons<T>() -> AnyPublisher<[T], Error> where T : SystemBeacon, T.Constraint : SystemBeaconIdentityConstraint {
        rangeBeaconsSubject
            .map {
                $0.compactMap {
                    .init(
                        uuid: $0.uuid,
                        major: $0.minor,
                        minor: $0.minor,
                        proximity: .init(rawValue: $0.proximity.rawValue) ?? .unknown,
                        accuracy: $0.accuracy,
                        rssi: $0.rssi,
                        beaconIdentityConstraint: T.Constraint(
                            uuid: $0.uuid
                        )
                    )
                }
            }
            .eraseToAnyPublisher()
    }
    
    public func didDetermineStateForRegion<T>() -> AnyPublisher<(SystemRegionState, T), Never> where T: SystemRegion, T.Constraint: SystemBeaconIdentityConstraint {
        stateForRegionSubject
            .compactMap { (state: CLRegionState, region: CLRegion) -> (SystemRegionState, T)? in
                guard let stateRegion = SystemRegionState(rawValue: state.rawValue) else { return nil }
                if let beaconRegion = region as? CLBeaconRegion {
                    return (
                        stateRegion,
                        T(
                            identifier: beaconRegion.identifier,
                            notifyOnEntry: beaconRegion.notifyOnEntry,
                            notifyOnExit: beaconRegion.notifyOnExit,
                            systemBeaconIdentityConstraint: T.Constraint(uuid: beaconRegion.uuid)
                        )
                    )
                } else {
                    return (
                        stateRegion,
                        .init(
                            identifier: region.identifier,
                            notifyOnEntry: region.notifyOnEntry,
                            notifyOnExit: region.notifyOnExit,
                            systemBeaconIdentityConstraint: nil
                        )
                    )
                }
            }.eraseToAnyPublisher()
    }
    
    public var didChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        didChangeAuthorizationSubject.eraseToAnyPublisher()
    }
    
    public var didFailWithError: AnyPublisher<Error, Never> {
        didFailWithErrorSubject.eraseToAnyPublisher()
    }
}

// MARK: - CLLocationManagerDelegate

extension RealLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationsSubject.send(locations)
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        didUpdateHeadingSubject.send(newHeading)
    }
    
    public func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        enterRegionSubject.send(region)
    }
    
    public func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        exitRegionSubject.send(region)
    }
    
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard let status = SystemLocationAuthorizationStatus(rawValue: CLLocationManager.authorizationStatus().rawValue) else { return }
        didChangeAuthorizationSubject.send(status)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint(error.localizedDescription)
        didFailWithErrorSubject.send(error)
    }
}
