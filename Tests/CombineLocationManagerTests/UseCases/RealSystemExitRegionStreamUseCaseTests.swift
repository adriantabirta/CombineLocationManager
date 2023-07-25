//
//  RealSystemExitRegionStreamUseCaseTests.swift
//
//
//  Created by at-plan-net on 01.03.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemExitRegionStreamUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemExitRegionStreamUseCase!
    
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

extension RealSystemExitRegionStreamUseCaseTests {
    
    func testExecuteOk() {
        let expectation = expectation(description: "RealSystemExitRegionStreamUseCaseTests::testExecuteOk")
        
        let expectedResult = SystemRegion.stub()
        
        locationManagerDelegate.stubbedExitRegionStream = Just(expectedResult).eraseToAnyPublisher()
        
        tested.execute()
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be not nil")
                XCTAssertEqual(self.locationManagerDelegate.invokedExitRegionStreamGetterCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
