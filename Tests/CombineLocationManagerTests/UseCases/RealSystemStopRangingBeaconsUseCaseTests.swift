//
//  RealSystemStopRangingBeaconsUseCaseTests.swift
//
//
//  Created by at-plan-net on 02.03.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemStopRangingBeaconsUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemStopRangingBeaconsUseCase!
    
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

extension RealSystemStopRangingBeaconsUseCaseTests {
    
    func testExecuteOk() {
        
        tested.execute(SystemBeaconIdentityConstraint.stub())
        
        XCTAssertEqual(self.locationManager.invokedStopRangingBeaconsCount, 1, "Should be equal")
    }
}
