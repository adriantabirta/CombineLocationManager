//
//  LocationManagerMock.swift
//
//
//  Created by at-plan-net on 12.07.2022.
//

import Combine
import CoreLocation
@testable import CombineLocationManager

// swiftlint: disable type_body_length
class LocationManagerMock: LocationManager {

    required init(_ locationManagerDelegate: LocationManagerDelegate) {}

    var invokedLastLocationGetter = false
    var invokedLastLocationGetterCount = 0
    var stubbedLastLocation: SystemLocation!

    var lastLocation: SystemLocation? {
        invokedLastLocationGetter = true
        invokedLastLocationGetterCount += 1
        return stubbedLastLocation
    }

    var invokedCurrentMonitoredRegionsGetter = false
    var invokedCurrentMonitoredRegionsGetterCount = 0
    var stubbedCurrentMonitoredRegions: Set<SystemRegion>! = []

    var currentMonitoredRegions: Set<SystemRegion> {
        invokedCurrentMonitoredRegionsGetter = true
        invokedCurrentMonitoredRegionsGetterCount += 1
        return stubbedCurrentMonitoredRegions
    }

    var invokedCurrentAuthorizationStatusGetter = false
    var invokedCurrentAuthorizationStatusGetterCount = 0
    var stubbedCurrentAuthorizationStatus: SystemLocationAuthorizationStatus!

    var currentAuthorizationStatus: SystemLocationAuthorizationStatus {
        invokedCurrentAuthorizationStatusGetter = true
        invokedCurrentAuthorizationStatusGetterCount += 1
        return stubbedCurrentAuthorizationStatus
    }

    var invokedLocationsStreamGetter = false
    var invokedLocationsStreamGetterCount = 0
    var stubbedLocationsStream: AnyPublisher<[SystemLocation], Error>!

    var locationsStream: AnyPublisher<[SystemLocation], Error> {
        invokedLocationsStreamGetter = true
        invokedLocationsStreamGetterCount += 1
        return stubbedLocationsStream
    }

    var invokedEnterRegionStreamGetter = false
    var invokedEnterRegionStreamGetterCount = 0
    var stubbedEnterRegionStream: AnyPublisher<SystemRegion, Never>!

    var enterRegionStream: AnyPublisher<SystemRegion, Never> {
        invokedEnterRegionStreamGetter = true
        invokedEnterRegionStreamGetterCount += 1
        return stubbedEnterRegionStream
    }

    var invokedExitRegionStreamGetter = false
    var invokedExitRegionStreamGetterCount = 0
    var stubbedExitRegionStream: AnyPublisher<SystemRegion, Never>!

    var exitRegionStream: AnyPublisher<SystemRegion, Never> {
        invokedExitRegionStreamGetter = true
        invokedExitRegionStreamGetterCount += 1
        return stubbedExitRegionStream
    }

    var invokedDidRangeBeaconsGetter = false
    var invokedDidRangeBeaconsGetterCount = 0
    var stubbedDidRangeBeacons: AnyPublisher<[SystemBeacon], Error>!

    var didRangeBeacons: AnyPublisher<[SystemBeacon], Error> {
        invokedDidRangeBeaconsGetter = true
        invokedDidRangeBeaconsGetterCount += 1
        return stubbedDidRangeBeacons
    }

    var invokedDidDetermineStateForRegionGetter = false
    var invokedDidDetermineStateForRegionGetterCount = 0
    var stubbedDidDetermineStateForRegion: AnyPublisher<(SystemRegionState, SystemRegion), Never>!

    var didDetermineStateForRegion: AnyPublisher<(SystemRegionState, SystemRegion), Never> {
        invokedDidDetermineStateForRegionGetter = true
        invokedDidDetermineStateForRegionGetterCount += 1
        return stubbedDidDetermineStateForRegion
    }

    var invokedDidChangeAuthorizationGetter = false
    var invokedDidChangeAuthorizationGetterCount = 0
    var stubbedDidChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never>!

    var didChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        invokedDidChangeAuthorizationGetter = true
        invokedDidChangeAuthorizationGetterCount += 1
        return stubbedDidChangeAuthorization
    }

    var invokedRequestWhenInUseAuthorization = false
    var invokedRequestWhenInUseAuthorizationCount = 0

    func requestWhenInUseAuthorization() {
        invokedRequestWhenInUseAuthorization = true
        invokedRequestWhenInUseAuthorizationCount += 1
    }

    var invokedRequestAlwaysAuthorization = false
    var invokedRequestAlwaysAuthorizationCount = 0

    func requestAlwaysAuthorization() {
        invokedRequestAlwaysAuthorization = true
        invokedRequestAlwaysAuthorizationCount += 1
    }

    var invokedRequestLocation = false
    var invokedRequestLocationCount = 0

    func requestLocation() {
        invokedRequestLocation = true
        invokedRequestLocationCount += 1
    }

    var invokedStartUpdatingLocation = false
    var invokedStartUpdatingLocationCount = 0

    func startUpdatingLocation() {
        invokedStartUpdatingLocation = true
        invokedStartUpdatingLocationCount += 1
    }

    var invokedStopUpdatingLocation = false
    var invokedStopUpdatingLocationCount = 0

    func stopUpdatingLocation() {
        invokedStopUpdatingLocation = true
        invokedStopUpdatingLocationCount += 1
    }

    var invokedStartMonitoring = false
    var invokedStartMonitoringCount = 0
    var invokedStartMonitoringParameters: (region: RegionProtocol, Void)?
    var invokedStartMonitoringParametersList = [(region: RegionProtocol, Void)]()

    func startMonitoring(for region: RegionProtocol) {
        invokedStartMonitoring = true
        invokedStartMonitoringCount += 1
        invokedStartMonitoringParameters = (region, ())
        invokedStartMonitoringParametersList.append((region, ()))
    }

    var invokedStopMonitoring = false
    var invokedStopMonitoringCount = 0
    var invokedStopMonitoringParameters: (region: RegionProtocol, Void)?
    var invokedStopMonitoringParametersList = [(region: RegionProtocol, Void)]()

    func stopMonitoring(for region: RegionProtocol) {
        invokedStopMonitoring = true
        invokedStopMonitoringCount += 1
        invokedStopMonitoringParameters = (region, ())
        invokedStopMonitoringParametersList.append((region, ()))
    }

    var invokedStartRangingBeacons = false
    var invokedStartRangingBeaconsCount = 0
    var invokedStartRangingBeaconsParameters: (constraint: SystemBeaconIdentityConstraint, Void)?
    var invokedStartRangingBeaconsParametersList = [(constraint: SystemBeaconIdentityConstraint, Void)]()

    func startRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint) {
        invokedStartRangingBeacons = true
        invokedStartRangingBeaconsCount += 1
        invokedStartRangingBeaconsParameters = (constraint, ())
        invokedStartRangingBeaconsParametersList.append((constraint, ()))
    }

    var invokedStopRangingBeacons = false
    var invokedStopRangingBeaconsCount = 0
    var invokedStopRangingBeaconsParameters: (constraint: SystemBeaconIdentityConstraint, Void)?
    var invokedStopRangingBeaconsParametersList = [(constraint: SystemBeaconIdentityConstraint, Void)]()

    func stopRangingBeacons(satisfying constraint: SystemBeaconIdentityConstraint) {
        invokedStopRangingBeacons = true
        invokedStopRangingBeaconsCount += 1
        invokedStopRangingBeaconsParameters = (constraint, ())
        invokedStopRangingBeaconsParametersList.append((constraint, ()))
    }
}
