//
//  LocationManagerDelegateMock.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

import Combine
import Foundation
@testable import CombineLocationManager

class LocationManagerDelegateMock: NSObject, LocationManagerDelegate {

    var invokedLocationsStreamGetter = false
    var invokedLocationsStreamGetterCount = 0
    var stubbedLocationsStream: AnyPublisher<[SystemLocation], Error>!

    var locationsStream: AnyPublisher<[SystemLocation], Error> {
        invokedLocationsStreamGetter = true
        invokedLocationsStreamGetterCount += 1
        return stubbedLocationsStream
    }

    var invokedDidUpdateHeadingStreamGetter = false
    var invokedDidUpdateHeadingStreamGetterCount = 0
    var stubbedDidUpdateHeadingStream: AnyPublisher<SystemHeading, Never>!

    var didUpdateHeadingStream: AnyPublisher<SystemHeading, Never> {
        invokedDidUpdateHeadingStreamGetter = true
        invokedDidUpdateHeadingStreamGetterCount += 1
        return stubbedDidUpdateHeadingStream
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

    var invokedDidFailWithErrorGetter = false
    var invokedDidFailWithErrorGetterCount = 0
    var stubbedDidFailWithError: AnyPublisher<Error, Never>!

    var didFailWithError: AnyPublisher<Error, Never> {
        invokedDidFailWithErrorGetter = true
        invokedDidFailWithErrorGetterCount += 1
        return stubbedDidFailWithError
    }
}
