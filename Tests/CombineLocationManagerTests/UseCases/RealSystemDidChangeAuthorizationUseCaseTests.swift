//
//  RealSystemDidChangeAuthorizationUseCaseTests.swift
//
//
//  Created by at on 28.04.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemDidChangeAuthorizationUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemDidChangeLocationAuthorizationUseCase!
    
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

extension RealSystemDidChangeAuthorizationUseCaseTests {
    
    func testExecuteOk() {
        let expectation = expectation(description: "RealSystemDidChangeAuthorizationUseCaseTests::testExecuteOk")
        
        let expectedResult = SystemLocationAuthorizationStatus.authorizedAlways
        
        locationManager.stubbedDidChangeAuthorization = Just(expectedResult).eraseToAnyPublisher()
        
        tested.execute()
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be not nil")
                XCTAssertEqual(self.locationManager.invokedDidChangeAuthorizationGetterCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
