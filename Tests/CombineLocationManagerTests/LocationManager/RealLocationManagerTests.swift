//
//  RealLocationManagerTests.swift
//  
//
//  Created by at on 25.07.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealLocationManagerTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemLocationManager!
    
    private var locationManagerDelegate: LocationManagerDelegateMock!
    
    private var cancellables: Set<AnyCancellable>!
    
    // MARK: - setUp and tearDown
    
    override func setUp() {
        super.setUp()
        
        locationManagerDelegate = LocationManagerDelegateMock()
        
        tested = .init(locationManagerDelegate)
        
        cancellables = .init()
    }
    
    override func tearDown() {
        super.tearDown()
        
        tested = nil
        
        locationManagerDelegate = nil
        
        cancellables = nil
    }
}

// MARK: - Tests

extension RealLocationManagerTests {
    
    func testInit() {
        XCTAssertNotNil(tested.delegate, "Should be not nil")
        XCTAssertTrue(tested.delegate.self is LocationManagerDelegate, "Should be not nil")
    }
    
    func testLocationsStreamOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testLocationsStreamOk")
        
        let expectedResult = [SystemLocationStub.stub()]
        
        locationManagerDelegate.stubbedGetLocationsStreamResult = Just(expectedResult).setFailureType(to: Error.self).eraseToAnyPublisher()
        
       (tested.getLocationsStream() as AnyPublisher<[SystemLocationStub], Error>)
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail("Should not enter here")
                    }
                }, receiveValue: { result in
                    XCTAssertEqual(result, expectedResult, "Should be equal")
                    XCTAssertEqual(self.locationManagerDelegate.invokedGetLocationsStreamCount, 1, "Should be not nil")
                    expectation.fulfill()
                })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testEnterRegionStreamOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testEnterRegionStreamOk")
        
        let expectedResult = SystemRegionStub.stub()
        
        locationManagerDelegate.stubbedGetEnterRegionStreamResult = Just(expectedResult).eraseToAnyPublisher()
        
        (tested.enterRegionStream() as AnyPublisher<SystemRegionStub, Never>)
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be equal")
                XCTAssertEqual(self.locationManagerDelegate.invokedGetEnterRegionStreamCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testExitRegionStreamOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testExitRegionStreamOk")
        
        let expectedResult = SystemRegionStub.stub()
        
        locationManagerDelegate.stubbedGetEnterRegionStreamResult = Just(expectedResult).eraseToAnyPublisher()
        
        (tested.enterRegionStream() as AnyPublisher<SystemRegionStub, Never>)
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be equal")
                XCTAssertEqual(self.locationManagerDelegate.invokedGetEnterRegionStreamCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testDidRangeBeaconsOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testDidRangeBeaconsOk")
        
        let expectedResult = [SystemBeaconStub.stub()]
        
        locationManagerDelegate.stubbedDidRangeBeaconsResult = Just(expectedResult).setFailureType(to: Error.self).eraseToAnyPublisher()
        
        (tested.didRangeBeacons() as AnyPublisher<[SystemBeaconStub], Error>)
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail("Should not enter here")
                    }
                }, receiveValue: { result in
                    XCTAssertEqual(result, expectedResult, "Should be equal")
                    XCTAssertEqual(self.locationManagerDelegate.invokedDidRangeBeaconsCount, 1, "Should be not nil")
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testdidDetermineStateForRegionOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testDidRangeBeaconsOk")
        
        let expectedResult = (SystemRegionState.inside, SystemRegionStub.stub())
        
        locationManagerDelegate.stubbedDidDetermineStateForRegionResult = Just(expectedResult).eraseToAnyPublisher()
        
        (tested.didDetermineStateForRegion() as AnyPublisher<(SystemRegionState, SystemRegionStub), Never>)
            .sink(receiveValue: { result in
                XCTAssertEqual(result.0, expectedResult.0, "Should be equal")
                XCTAssertEqual(result.1, expectedResult.1, "Should be equal")
                XCTAssertEqual(self.locationManagerDelegate.invokedDidDetermineStateForRegionCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testdidChangeAuthorizationOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testDidRangeBeaconsOk")
        
        let expectedResult = SystemLocationAuthorizationStatus.authorizedAlways
        
        locationManagerDelegate.stubbedDidChangeAuthorization = Just(expectedResult).eraseToAnyPublisher()
        
        tested.didChangeAuthorization
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be equal")
                XCTAssertEqual(self.locationManagerDelegate.invokedDidChangeAuthorizationGetterCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
