//
//  RealSystemGetLastLocationUseCaseTests.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemGetLastLocationUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemGetLastLocationUseCase!
    
    private var locationManager: LocationManagerMock!
    
    private var cancellables: Set<AnyCancellable>!
    
    // MARK: - setUp and tearDown
    
    override func setUp() {
        super.setUp()
                
        locationManager = LocationManagerMock(LocationManagerDelegateMock())

        tested = .init(locationManager)
                
        cancellables = .init()
    }
    
    override func tearDown() {
        super.tearDown()
                
        tested = nil
        
        locationManager = nil
        
        cancellables = nil
    }
}

// MARK: - Tests

extension RealSystemGetLastLocationUseCaseTests {
    
    func testExecuteOk() {
        let expectation = expectation(description: "RealSystemGetLastLocationUseCaseTests::testExecuteOk")
        
        let expectedResult = SystemLocation.stub()
        
        locationManager.stubbedLastLocation = expectedResult
        
        tested.execute()
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be not nil")
                XCTAssertEqual(self.locationManager.invokedLastLocationGetterCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}