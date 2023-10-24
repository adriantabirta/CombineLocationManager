//
//  LocationManagerDelegateMock.swift
//
//
//  Created by at on 02.03.2023.
//

import Combine
import Foundation
@testable import CombineLocationManager

class LocationManagerDelegateMock: NSObject, LocationManagerDelegate {

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

    var invokedGetEnterRegionStream = false
    var invokedGetEnterRegionStreamCount = 0
    var stubbedGetEnterRegionStreamResult: AnyPublisher<Any, Never>!

    func getEnterRegionStream<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint {
        invokedGetEnterRegionStream = true
        invokedGetEnterRegionStreamCount += 1
        return stubbedGetEnterRegionStreamResult.compactMap { $0 as? T }.eraseToAnyPublisher()
    }

    var invokedGetExitRegionStream = false
    var invokedGetExitRegionStreamCount = 0
    var stubbedGetExitRegionStreamResult: AnyPublisher<Any, Never>!

    func getExitRegionStream<T: SystemRegion>() -> AnyPublisher<T, Never> where T.Constraint: SystemBeaconIdentityConstraint {
        invokedGetExitRegionStream = true
        invokedGetExitRegionStreamCount += 1
        return stubbedGetExitRegionStreamResult.compactMap { $0 as? T }.eraseToAnyPublisher()
    }

    var invokedDidRangeBeacons = false
    var invokedDidRangeBeaconsCount = 0
    var stubbedDidRangeBeaconsResult: AnyPublisher<[Any], Error>!

    func didRangeBeacons<T: SystemBeacon>() -> AnyPublisher<[T], Error> where T.Constraint: SystemBeaconIdentityConstraint {
        invokedDidRangeBeacons = true
        invokedDidRangeBeaconsCount += 1
        return stubbedDidRangeBeaconsResult.compactMap { $0.compactMap { $0 as? T } }.eraseToAnyPublisher()
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
