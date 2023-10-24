//
//  LocationManagerMock.swift
//
//
//  Created by at on 12.07.2022.
//

import Combine
import CoreLocation
@testable import CombineLocationManager

// swiftlint: disable type_body_length identifier_name
class LocationManagerMock: SystemLocationManager {

    required init(_ locationManagerDelegate: LocationManagerDelegate) {}

    var invokedCurrentAuthorizationStatusGetter = false
    var invokedCurrentAuthorizationStatusGetterCount = 0
    var stubbedCurrentAuthorizationStatus: SystemLocationAuthorizationStatus!

    var currentAuthorizationStatus: SystemLocationAuthorizationStatus {
        invokedCurrentAuthorizationStatusGetter = true
        invokedCurrentAuthorizationStatusGetterCount += 1
        return stubbedCurrentAuthorizationStatus
    }

    var invokedCurrentAccuracyAuthorizationGetter = false
    var invokedCurrentAccuracyAuthorizationGetterCount = 0
    var stubbedCurrentAccuracyAuthorization: SystemAccuracyAuthorization!

    var currentAccuracyAuthorization: SystemAccuracyAuthorization {
        invokedCurrentAccuracyAuthorizationGetter = true
        invokedCurrentAccuracyAuthorizationGetterCount += 1
        return stubbedCurrentAccuracyAuthorization
    }

    var invokedCurrentHeadingOrientationGetter = false
    var invokedCurrentHeadingOrientationGetterCount = 0
    var stubbedCurrentHeadingOrientation: DeviceOrientation!

    var currentHeadingOrientation: DeviceOrientation {
        invokedCurrentHeadingOrientationGetter = true
        invokedCurrentHeadingOrientationGetterCount += 1
        return stubbedCurrentHeadingOrientation
    }

    var invokedDidChangeAuthorizationGetter = false
    var invokedDidChangeAuthorizationGetterCount = 0
    var stubbedDidChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never>!

    var didChangeAuthorization: AnyPublisher<SystemLocationAuthorizationStatus, Never> {
        invokedDidChangeAuthorizationGetter = true
        invokedDidChangeAuthorizationGetterCount += 1
        return stubbedDidChangeAuthorization
    }

    var invokedDidFailWithErrorGetter = false
    var invokedDidFailWithErrorGetterCount = 0
    var stubbedDidFailWithError: AnyPublisher<Error, Never>!

    var didFailWithError: AnyPublisher<Error, Never> {
        invokedDidFailWithErrorGetter = true
        invokedDidFailWithErrorGetterCount += 1
        return stubbedDidFailWithError
    }

    var invokedGetLastLocation = false
    var invokedGetLastLocationCount = 0
    var stubbedGetLastLocationResult: Any!

    func getLastLocation<T: SystemLocation>() -> T? where T.Coordinate: SystemCoordinate {
        invokedGetLastLocation = true
        invokedGetLastLocationCount += 1
        return stubbedGetLastLocationResult as? T
    }

    var invokedGetCurrentMonitoredRegions = false
    var invokedGetCurrentMonitoredRegionsCount = 0
    var stubbedGetCurrentMonitoredRegionsResult: [Any]! = []

    func getCurrentMonitoredRegions<T: SystemRegion>() -> [T] {
        invokedGetCurrentMonitoredRegions = true
        invokedGetCurrentMonitoredRegionsCount += 1
        return stubbedGetCurrentMonitoredRegionsResult.compactMap { $0 as? T }
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

    var invokedRequestTemporaryFullAccuracyAuthorization = false
    var invokedRequestTemporaryFullAccuracyAuthorizationCount = 0
    var invokedRequestTemporaryFullAccuracyAuthorizationParameters: (purposeKey: String, Void)?
    var invokedRequestTemporaryFullAccuracyAuthorizationParametersList = [(purposeKey: String, Void)]()

    func requestTemporaryFullAccuracyAuthorization(withPurposeKey purposeKey: String) {
        invokedRequestTemporaryFullAccuracyAuthorization = true
        invokedRequestTemporaryFullAccuracyAuthorizationCount += 1
        invokedRequestTemporaryFullAccuracyAuthorizationParameters = (purposeKey, ())
        invokedRequestTemporaryFullAccuracyAuthorizationParametersList.append((purposeKey, ()))
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

    var invokedStartUpdatingHeading = false
    var invokedStartUpdatingHeadingCount = 0

    func startUpdatingHeading() {
        invokedStartUpdatingHeading = true
        invokedStartUpdatingHeadingCount += 1
    }

    var invokedStopUpdatingHeading = false
    var invokedStopUpdatingHeadingCount = 0

    func stopUpdatingHeading() {
        invokedStopUpdatingHeading = true
        invokedStopUpdatingHeadingCount += 1
    }

    var invokedDismissHeadingCalibrationDisplay = false
    var invokedDismissHeadingCalibrationDisplayCount = 0

    func dismissHeadingCalibrationDisplay() {
        invokedDismissHeadingCalibrationDisplay = true
        invokedDismissHeadingCalibrationDisplayCount += 1
    }

    var invokedStartMonitoring = false
    var invokedStartMonitoringCount = 0
    var invokedStartMonitoringParameters: (region: Any, Void)?
    var invokedStartMonitoringParametersList = [(region: Any, Void)]()

    func startMonitoring<T: SystemGenericRegion>(for region: T) {
        invokedStartMonitoring = true
        invokedStartMonitoringCount += 1
        invokedStartMonitoringParameters = (region, ())
        invokedStartMonitoringParametersList.append((region, ()))
    }

    var invokedStopMonitoring = false
    var invokedStopMonitoringCount = 0
    var invokedStopMonitoringParameters: (region: Any, Void)?
    var invokedStopMonitoringParametersList = [(region: Any, Void)]()

    func stopMonitoring<T: SystemGenericRegion>(for region: T) {
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

    var invokedGetLocationsStream = false
    var invokedGetLocationsStreamCount = 0
    var stubbedGetLocationsStreamResult: AnyPublisher<[Any], Error>!

    func getLocationsStream<T: SystemLocation>() -> AnyPublisher<[T], Error> where T.Coordinate: SystemCoordinate {
        invokedGetLocationsStream = true
        invokedGetLocationsStreamCount += 1
        return stubbedGetLocationsStreamResult.map { $0.compactMap { $0 as? T } }.eraseToAnyPublisher()
    }

    var invokedDidUpdateHeadingStream = false
    var invokedDidUpdateHeadingStreamCount = 0
    var stubbedDidUpdateHeadingStreamResult: AnyPublisher<Any, Never>!

    func didUpdateHeadingStream<T: SystemHeading>() -> AnyPublisher<T, Never> {
        invokedDidUpdateHeadingStream = true
        invokedDidUpdateHeadingStreamCount += 1
        return stubbedDidUpdateHeadingStreamResult.compactMap { $0 as? T }.eraseToAnyPublisher()
    }

    var invokedEnterRegionStream = false
    var invokedEnterRegionStreamCount = 0
    var stubbedEnterRegionStreamResult: AnyPublisher<Any, Never>!

    func enterRegionStream<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint {
        invokedEnterRegionStream = true
        invokedEnterRegionStreamCount += 1
        return stubbedEnterRegionStreamResult.compactMap { $0 as? T }.eraseToAnyPublisher()
    }

    var invokedExitRegionStream = false
    var invokedExitRegionStreamCount = 0
    var stubbedExitRegionStreamResult: AnyPublisher<Any, Never>!

    func exitRegionStream<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint {
        invokedExitRegionStream = true
        invokedExitRegionStreamCount += 1
        return stubbedExitRegionStreamResult.compactMap { $0 as? T }.eraseToAnyPublisher()
    }

    var invokedDidRangeBeacons = false
    var invokedDidRangeBeaconsCount = 0
    var stubbedDidRangeBeaconsResult: AnyPublisher<[Any], Error>!

    func didRangeBeacons<T: SystemBeacon>() -> AnyPublisher<[T], Error> where T.Constraint: SystemBeaconIdentityConstraint {
        invokedDidRangeBeacons = true
        invokedDidRangeBeaconsCount += 1
        return stubbedDidRangeBeaconsResult.map { $0.compactMap { $0 as? T } }.eraseToAnyPublisher()
    }

    var invokedDidDetermineStateForRegion = false
    var invokedDidDetermineStateForRegionCount = 0
    var stubbedDidDetermineStateForRegionResult: AnyPublisher<(SystemRegionState, Any), Never>!

    func didDetermineStateForRegion<T: SystemRegion>() -> AnyPublisher<(SystemRegionState, T), Never> where T.Constraint: SystemBeaconIdentityConstraint {
        invokedDidDetermineStateForRegion = true
        invokedDidDetermineStateForRegionCount += 1
        return stubbedDidDetermineStateForRegionResult.compactMap { $0 as? (SystemRegionState, T) }.eraseToAnyPublisher()
    }
}
// swiftlint: enable type_body_length identifier_name
