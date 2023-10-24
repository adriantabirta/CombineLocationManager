//
//  RealSystemGetLocationAuthorizationStatusUseCaseTests.swift
//
//
//  Created by at on 02.03.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemGetLocationAuthorizationStatusUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemGetLocationAuthorizationStatusUseCase!
    
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

extension RealSystemGetLocationAuthorizationStatusUseCaseTests {
    
    func testExecuteOk() {
        let expectation = expectation(description: "RealSystemGetLocationAuthorizationStatusUseCaseTests::testExecuteOk")
        
        let expectedResult = SystemLocationAuthorizationStatus.authorizedAlways
        
        locationManager.stubbedCurrentAuthorizationStatus = expectedResult
        
        tested.execute()
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be not nil")
                XCTAssertEqual(self.locationManager.invokedCurrentAuthorizationStatusGetterCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
