//
//  RealSystemDidRangeBeaconsStreamUseCaseTests.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemDidRangeBeaconsStreamUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemDidRangeBeaconsStreamUseCase!
    
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

extension RealSystemDidRangeBeaconsStreamUseCaseTests {
    
    func testExecuteOk() {
        let expectation = expectation(description: "RealSystemDidRangeBeaconsStreamUseCaseTests::testExecuteOk")
        
        let expectedResult = [SystemBeacon.stub()]
        
        locationManagerDelegate.stubbedDidRangeBeacons = Just(expectedResult).setFailureType(to: Error.self).eraseToAnyPublisher()
        
        tested.execute()
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail("Should not enter here")
                    }
                }, receiveValue: { result in
                    XCTAssertEqual(result, expectedResult)
                    expectation.fulfill()
                }).store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testExecuteFail() {
        let expectation = expectation(description: "RealSystemDidRangeBeaconsStreamUseCaseTests::testExecuteOk")
        
        locationManagerDelegate.stubbedDidRangeBeacons = Fail(error: NSError.init(domain: "Error", code: -1)).eraseToAnyPublisher()
        
        tested.execute()
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        expectation.fulfill()
                    }
                }, receiveValue: { _ in
                    XCTFail("Should not enter here")
                }).store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
