//
//  RealSystemGetMonitoredRegionsUseCaseTests.swift
//
//
//  Created by at on 01.03.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemGetMonitoredRegionsUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemGetMonitoredRegionsUseCase!
    
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

extension RealSystemGetMonitoredRegionsUseCaseTests {
    
    func testExecuteOk() {
        
        let expectedResult = [SystemRegionStub.stub()]
        
        locationManager.stubbedGetCurrentMonitoredRegionsResult = expectedResult
        
        let result: [SystemRegionStub] = tested.execute()
        
        XCTAssertEqual(result, expectedResult, "Should be not nil")
    }
}
