//
//  RealSystemGetCurrentLocationUseCaseTests.swift
//
//
//  Created by at-plan-net on 28.04.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemGetCurrentLocationUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemGetCurrentLocationUseCase!
    
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

extension RealSystemGetCurrentLocationUseCaseTests {
    
    func testExecuteOk() {
        let expectation = expectation(description: "RealSystemGetCurrentLocationUseCaseTests::testExecuteOk")
        
        let expectedResult = SystemLocation.stub()
        
        locationManager.stubbedLocationsStream = Just([expectedResult]).setFailureType(to: Error.self).eraseToAnyPublisher()
        
        tested.execute()
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail("Should not enter here")
                    }
                }, receiveValue: { result in
                    XCTAssertEqual(result, expectedResult, "Should be not nil")
                    XCTAssertEqual(self.locationManager.invokedRequestLocationCount, 1, "Should be not nil")
                    XCTAssertEqual(self.locationManager.invokedLocationsStreamGetterCount, 1, "Should be not nil")
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
