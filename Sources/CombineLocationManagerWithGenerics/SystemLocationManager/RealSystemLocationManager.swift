//
//  RealSystemLocationManager.swift
//
//
//  Created by Adrian Tabirta on 10.03.2023.
//

import Combine
import CoreLocation

public class RealSystemLocationManager: CLLocationManager {
    
    // MARK: - Properties
    
    private var locationManagerDelegate: LocationManagerDelegate
    
    // MARK: - Init
    
    required public init(_ locationManagerDelegate: LocationManagerDelegate) {
        self.locationManagerDelegate = locationManagerDelegate
        super.init()
        self.delegate = locationManagerDelegate
    }
}

// MARK: - SystemLocationManager implementation

extension RealSystemLocationManager: SystemLocationManager {
    
    public func getLastLocation<T>() -> T? where T : SystemLocation, T.Coordinate : SystemCoordinate {
        guard let location = self.location else { return nil }
        return T(
            coordinate: T.Coordinate(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            ),
            horizontalAccuracy: location.horizontalAccuracy,
            direction: location.course,
            timestamp: location.timestamp
        )
    }
    
    public func getCurrentMonitoredRegions<T>() -> [T] where T : SystemRegion {
        monitoredRegions
            .map {
                .init(
                    identifier: $0.identifier,
                    notifyOnEntry: $0.notifyOnExit,
                    notifyOnExit: $0.notifyOnExit,
                    systemBeaconIdentityConstraint: nil
                )
            }
    }
    
    @available(iOS 14.0, *)
    public var systemAccuracyAuthorization: SystemAccuracyAuthorization {
        .init(rawValue: super.accuracyAuthorization.rawValue) ?? .reducedAccuracy
    }
    
    public var currentAuthorizationStatus: SystemLocationAuthorizationStatus {
        if #available(iOS 14.0, *) {
            return SystemLocationAuthorizationStatus(rawValue: super.authorizationStatus.rawValue) ?? .notDetermined
        } else {
            return SystemLocationAuthorizationStatus(rawValue: CLLocationManager.authorizationStatus().rawValue) ?? .notDetermined
        }
    }
    
    @available(iOS 14.0, *)
    public var currentAccuracyAuthorization: SystemAccuracyAuthorization {
        SystemAccuracyAuthorization.init(rawValue: super.accuracyAuthorization.rawValue) ?? .reducedAccuracy
    }
    
    public var currentHeadingOrientation: DeviceOrientation {
        DeviceOrientation(rawValue: super.headingOrientation.rawValue) ?? .portrait
    }
    
    public func startMonitoring<T>(for region: T) where T : SystemGenericRegion {
        if let circularRegion = region as? SystemCircularRegion {
            super.startMonitoring(
                for: CLCircularRegion(
                    center: .init(
                        latitude: circularRegion.coordinate.latitude,
                        longitude: circularRegion.coordinate.longitude
                    ),
                    radius: circularRegion.radius,
                    identifier: circularRegion.identifier
                )
            )
        }
        
        if let beaconRegion = region as? any SystemBeaconRegion {
            super.startMonitoring(
                for: CLBeaconRegion(
                    uuid: beaconRegion.beaconIdentityConstraintDataModel.uuid,
                    identifier: beaconRegion.identifier
                )
            )
        }
    }
    
    public func stopMonitoring<T>(for region: T) where T : SystemGenericRegion {
        if let circularRegion = region as? SystemCircularRegion {
            super.stopMonitoring(
                for: CLCircularRegion(
                    center: .init(
                        latitude: circularRegion.coordinate.latitude,
                        longitude: circularRegion.coordinate.longitude
                    ),
                    radius: circularRegion.radius,
                    identifier: circularRegion.identifier
                )
            )
        }
        
        if let beaconRegion = region as? SystemBeaconRegion {
            super.stopMonitoring(
                for: CLBeaconRegion(
                    uuid: beaconRegion.beaconIdentityConstraintDataModel.uuid,
                    identifier: beaconRegion.identifier
                )
            )
        }
    }
    
    public func startRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint) {
        super.startRangingBeacons(satisfying: CLBeaconIdentityConstraint(uuid: constraint.uuid))
    }
    
    public func stopRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint) {
        super.stopRangingBeacons(satisfying: CLBeaconIdentityConstraint(uuid: constraint.uuid))
    }
    
    public func getLocationsStream<T>() -> AnyPublisher<[T], Error> where T : SystemLocation, T.Coordinate : SystemCoordinate {
        locationManagerDelegate.getLocationsStream()
    }
    
    public func didUpdateHeadingStream<T>() -> AnyPublisher<T, Never> where T : SystemHeading {
        locationManagerDelegate.didUpdateHeadingStream()
    }
    
    public func enterRegionStream<T>() -> AnyPublisher<T, Never> where T : SystemRegion, T.Constraint: SystemBeaconIdentityConstraint {
        locationManagerDelegate.getEnterRegionStream()
    }
    
    public func exitRegionStream<T>() -> AnyPublisher<T, Never> where T : SystemRegion, T.Constraint: SystemBeaconIdentityConstraint {
        locationManagerDelegate.getExitRegionStream()
    }
    
    public func didRangeBeacons<T>() -> AnyPublisher<[T], Error> where T : SystemBeacon, T.Constraint : SystemBeaconIdentityConstraint {
        locationManagerDelegate.didRangeBeacons()
    }
    
    public func didDetermineStateForRegion<T>() -> AnyPublisher<(SystemRegionState, T), Never> where T : SystemRegion, T.Constraint: SystemBeaconIdentityConstraint {
        locationManagerDelegate.didDetermineStateForRegion()
    }
    
    public var didChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        locationManagerDelegate.didChangeAuthorization
    }
    
    public var didFailWithError: AnyPublisher<Error, Never> {
        locationManagerDelegate.didFailWithError
    }
}
