//
//  RealLocationManagerTests.swift
//  
//
//  Created by at-plan-net on 25.07.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealLocationManagerTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealLocationManager!
    
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
        
        let expectedResult = [SystemLocation.stub()]
        
        locationManagerDelegate.stubbedLocationsStream = Just(expectedResult).setFailureType(to: Error.self).eraseToAnyPublisher()
        
        tested.locationsStream
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail("Should not enter here")
                    }
                }, receiveValue: { result in
                    XCTAssertEqual(result, expectedResult, "Should be equal")
                    XCTAssertEqual(self.locationManagerDelegate.invokedLocationsStreamGetterCount, 1, "Should be not nil")
                    expectation.fulfill()
                })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testEnterRegionStreamOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testEnterRegionStreamOk")
        
        let expectedResult = SystemRegion.stub()
        
        locationManagerDelegate.stubbedEnterRegionStream = Just(expectedResult).eraseToAnyPublisher()
        
        tested.enterRegionStream
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be equal")
                XCTAssertEqual(self.locationManagerDelegate.invokedEnterRegionStreamGetterCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testExitRegionStreamOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testExitRegionStreamOk")
        
        let expectedResult = SystemRegion.stub()
        
        locationManagerDelegate.stubbedExitRegionStream = Just(expectedResult).eraseToAnyPublisher()
        
        tested.exitRegionStream
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be equal")
                XCTAssertEqual(self.locationManagerDelegate.invokedExitRegionStreamGetterCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testDidRangeBeaconsOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testDidRangeBeaconsOk")
        
        let expectedResult = [SystemBeacon.stub()]
        
        locationManagerDelegate.stubbedDidRangeBeacons = Just(expectedResult).setFailureType(to: Error.self).eraseToAnyPublisher()
        
        tested.didRangeBeacons
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail("Should not enter here")
                    }
                }, receiveValue: { result in
                    XCTAssertEqual(result, expectedResult, "Should be equal")
                    XCTAssertEqual(self.locationManagerDelegate.invokedDidRangeBeaconsGetterCount, 1, "Should be not nil")
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testdidDetermineStateForRegionOk() {
        let expectation = expectation(description: "RealLocationManagerTests::testDidRangeBeaconsOk")
        
        let expectedResult = (SystemRegionState.inside, SystemRegion.stub())
        
        locationManagerDelegate.stubbedDidDetermineStateForRegion = Just(expectedResult).eraseToAnyPublisher()
        
        tested.didDetermineStateForRegion
            .sink(receiveValue: { result in
                XCTAssertEqual(result.0, expectedResult.0, "Should be equal")
                XCTAssertEqual(result.1, expectedResult.1, "Should be equal")
                XCTAssertEqual(self.locationManagerDelegate.invokedDidDetermineStateForRegionGetterCount, 1, "Should be not nil")
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
