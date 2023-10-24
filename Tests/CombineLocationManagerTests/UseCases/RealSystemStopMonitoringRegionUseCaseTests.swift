//
//  RealSystemStopMonitoringRegionUseCaseTests.swift
//
//
//  Created by at on 01.03.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemStopMonitoringRegionUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemStopMonitoringRegionUseCase!
    
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

extension RealSystemStopMonitoringRegionUseCaseTests {
    
    func testExecuteOk() {
        
        tested.execute(SystemCircularRegionStub.stub())
        
        XCTAssertEqual(locationManager.invokedStopMonitoringCount, 1, "Should be equal")
    }
}
