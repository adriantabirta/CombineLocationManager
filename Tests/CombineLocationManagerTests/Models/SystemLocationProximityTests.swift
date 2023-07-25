//
//  SystemLocationProximityTests.swift
//
//
//  Created by at-plan-net on 03.03.2023.
//

import XCTest
@testable import CombineLocationManager

final class SystemLocationProximityTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: SystemLocationProximity!
    
    // MARK: - setUp and tearDown
    
    override func setUp() {
        super.setUp()
        
        tested = .near
    }
    
    override func tearDown() {
        super.tearDown()
        
        tested = nil
    }
}

// MARK: - Tests

extension SystemLocationProximityTests {
    
    func testDescriptionOk() {
        
        let expectedResult = "near"
        
        let result = tested.description
        
        XCTAssertEqual(result, expectedResult, "Should be equal")
    }
}
