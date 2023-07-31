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

// MARK: - LocationManager

extension RealSystemLocationManager: SystemLocationManager {
    
    public var lastLocation: SystemLocation? {
        guard let location = self.location else { return nil }
        return SystemLocation(
            coordinate: .init(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            ),
            direction: location.course,
            timestamp: location.timestamp
        )
    }
    
    public var currentMonitoredRegions: Set<SystemRegion> {
        Set(
            monitoredRegions
                .map {
                    SystemRegion(
                        identifier: $0.identifier,
                        notifyOnEntry: $0.notifyOnExit,
                        notifyOnExit: $0.notifyOnExit,
                        systemBeaconIdentityConstraint: nil
                    )
                }
        )
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
    
    public func startMonitoring(for region: RegionProtocol) {
        
        if let circularRegion = region as? SystemCircularRegion {
            super.startMonitoring(for: SystemCircularRegionToCLCircularRegionMapper().map(from: circularRegion))
        }
        
        if let beaconRegion = region as? SystemBeaconRegion {
            super.startMonitoring(for: CLBeaconRegion(uuid: beaconRegion.beaconIdentityConstraintDataModel.uuid, identifier: beaconRegion.identifier))
        }
    }
    
    public func stopMonitoring(for region: RegionProtocol) {
        
        if let circularRegion = region as? SystemCircularRegion {
            super.stopMonitoring(for: SystemCircularRegionToCLCircularRegionMapper().map(from: circularRegion))
        }
        
        if let beaconRegion = region as? SystemBeaconRegion {
            super.stopMonitoring(for: CLBeaconRegion(uuid: beaconRegion.beaconIdentityConstraintDataModel.uuid, identifier: beaconRegion.identifier))
        }
    }
    
    public func startRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint) {
        super.startRangingBeacons(satisfying: CLBeaconIdentityConstraint(uuid: constraint.uuid))
    }
    
    public func stopRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint) {
        super.stopRangingBeacons(satisfying: CLBeaconIdentityConstraint(uuid: constraint.uuid))
    }
    
    public var locationsStream: AnyPublisher<[SystemLocation], Error> {
        locationManagerDelegate.locationsStream
    }
    
    public var enterRegionStream: AnyPublisher<SystemRegion, Never> {
        locationManagerDelegate.enterRegionStream
    }
    
    public var exitRegionStream: AnyPublisher<SystemRegion, Never> {
        locationManagerDelegate.exitRegionStream
    }
    
    public var didRangeBeacons: AnyPublisher<[SystemBeacon], Error> {
        locationManagerDelegate.didRangeBeacons
    }
    
    public var didDetermineStateForRegion: AnyPublisher<(SystemRegionState, SystemRegion), Never> {
        locationManagerDelegate.didDetermineStateForRegion
    }
    
    public var didChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        locationManagerDelegate.didChangeAuthorization
    }
    
    public var didFailWithError: AnyPublisher<Error, Never> {
        locationManagerDelegate.didFailWithError
    }
}
