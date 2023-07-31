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
    
    public override init() {
        super.init()
    }
}

// MARK: - LocationManagerDelegate

extension RealLocationManagerDelegate: LocationManagerDelegate {
    
    public var locationsStream: AnyPublisher<[SystemLocation], Error> {
        locationsSubject
            .map { CLLocationToSystemLocationMapper().map(model: $0) }
            .eraseToAnyPublisher()
    }
    
    public var didUpdateHeadingStream: AnyPublisher<SystemHeading, Never> {
        didUpdateHeadingSubject
            .map {
                SystemHeading(
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
    
    public var enterRegionStream: AnyPublisher<SystemRegion, Never> {
        enterRegionSubject
            .map { CLRegionToSystemRegionMapper().map(from: $0) }
            .eraseToAnyPublisher()
    }
    
    public var exitRegionStream: AnyPublisher<SystemRegion, Never> {
        enterRegionSubject
            .map { CLRegionToSystemRegionMapper().map(from: $0) }
            .eraseToAnyPublisher()
    }
    
    public var didRangeBeacons: AnyPublisher<[SystemBeacon], Error> {
        rangeBeaconsSubject
            .map { $0.map { CLBeaconToSystemBeaconMapper().map(from: $0) } }
            .eraseToAnyPublisher()
    }
    
    public var didDetermineStateForRegion: AnyPublisher<(SystemRegionState, SystemRegion), Never> {
        stateForRegionSubject
            .compactMap { (state: CLRegionState, region: CLRegion) -> (SystemRegionState, SystemRegion)? in
                guard let stateRegion = SystemRegionState(rawValue: state.rawValue) else { return nil }
                return (stateRegion, CLRegionToSystemRegionMapper().map(from: region))
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
