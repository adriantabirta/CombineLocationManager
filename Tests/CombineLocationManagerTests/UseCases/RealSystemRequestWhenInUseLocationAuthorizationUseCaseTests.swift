//
//  RealSystemRequestWhenInUseLocationAuthorizationUseCaseTests.swift
//
//
//  Created by at on 02.03.2023.
//

import XCTest
import Combine
@testable import CombineLocationManager

final class RealSystemRequestWhenInUseLocationAuthorizationUseCaseTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: RealSystemRequestWhenInUseLocationAuthorizationUseCase!
    
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

extension RealSystemRequestWhenInUseLocationAuthorizationUseCaseTests {
    
    func testExecuteOk() {
        
        tested.execute()
        
        XCTAssertEqual(self.locationManager.invokedRequestWhenInUseAuthorizationCount, 1, "Should be not nil")
    }
}
