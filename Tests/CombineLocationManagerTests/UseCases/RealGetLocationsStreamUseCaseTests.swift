//
//  RealGetLocationsStreamUseCaseTests.swift
//
//
//  Created by at-plan-net on 27.02.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealGetLocationsStreamUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemGetLocationsStreamUseCase!
    
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

extension RealGetLocationsStreamUseCaseTests {
    
    func testExecuteOk() {
        let expectation = expectation(description: "RealGetLocationsStreamUseCaseTests::testExecuteOk")
        
        let expectedResult = [SystemLocation(coordinate: .init(latitude: 1.0, longitude: 2.0), direction: 1)]
        
        locationManagerDelegate.stubbedLocationsStream = Just(expectedResult).setFailureType(to: Error.self).eraseToAnyPublisher()
        
        tested.execute()
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        XCTFail("Should not enter here")
                    }
                }, receiveValue: { result in
                    XCTAssertEqual(result, expectedResult, "Should be not nil")
                    XCTAssertEqual(self.locationManagerDelegate.invokedLocationsStreamGetterCount, 1, "Should be not nil")
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
