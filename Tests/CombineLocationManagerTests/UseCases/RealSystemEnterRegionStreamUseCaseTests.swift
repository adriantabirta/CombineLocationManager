//
//  RealSystemEnterRegionStreamUseCaseTests.swift
//
//
//  Created by at on 01.03.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemEnterRegionStreamUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemEnterRegionStreamUseCase!
    
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

extension RealSystemEnterRegionStreamUseCaseTests {
    
    func testExecuteOk() {
        let expectation = expectation(description: "RealSystemEnterRegionStreamUseCaseTests::testExecuteOk")
        
        let expectedResult = SystemRegionStub.stub()
        
        locationManagerDelegate.stubbedGetEnterRegionStreamResult = Just(expectedResult).eraseToAnyPublisher()
        
        (tested.execute() as AnyPublisher<SystemRegionStub, Never>)
            .sink(receiveValue: { result in
                XCTAssertEqual(result, expectedResult, "Should be not nil")
                XCTAssertEqual(self.locationManagerDelegate.invokedGetEnterRegionStreamCount, 1, "Should be not nil")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
