//
//  SystemRegionStateTests.swift
//
//
//  Created by at-plan-net on 03.03.2023.
//

import XCTest
@testable import CombineLocationManager

final class SystemRegionStateTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: SystemRegionState!
    
    // MARK: - setUp and tearDown
    
    override func setUp() {
        super.setUp()
                
        tested = .inside
    }
    
    override func tearDown() {
        super.tearDown()
        
        tested = nil
    }
}

// MARK: - Tests

extension SystemRegionStateTests {
    
    func testDescriptionOk() {
        
        let expectedResult = "inside"
        
        let result = tested.description
        
        XCTAssertEqual(result, expectedResult, "Should be equal")
    }
}
