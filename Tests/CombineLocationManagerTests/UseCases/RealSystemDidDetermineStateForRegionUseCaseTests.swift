//
//  RealSystemDidDetermineStateForRegionUseCaseTests.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

import XCTest
import Combine
import CoreLocation
@testable import CombineLocationManager

final class RealSystemDidDetermineStateForRegionUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemDidDetermineStateForRegionUseCase!
    
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

extension RealSystemDidDetermineStateForRegionUseCaseTests {
    
    func testExecuteOk() {
        let expectation = expectation(description: "RealSystemDidDetermineStateForRegionUseCaseTests::testExecuteOk")
        
        let expectedResult = (SystemRegionState.inside, SystemRegion.stub())
        
        locationManagerDelegate.stubbedDidDetermineStateForRegion = Just(expectedResult).eraseToAnyPublisher()
        
        tested.execute()
            .sink { (systemRegionState, systemRegion) in
                XCTAssertEqual(systemRegionState, expectedResult.0)
                XCTAssertEqual(systemRegion, expectedResult.1)
                expectation.fulfill()
            }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
}
