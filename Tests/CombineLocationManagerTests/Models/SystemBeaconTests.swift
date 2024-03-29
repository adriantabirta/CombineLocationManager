//
//  SystemBeaconTests.swift
//
//
//  Created by at on 03.03.2023.
//

import XCTest
@testable import CombineLocationManager

final class SystemBeaconTests: XCTestCase {
    
    // MARK: - Properties
    
    private var tested: SystemBeaconStub!
    
    // MARK: - setUp and tearDown
    
    override func setUp() {
        super.setUp()
        
        tested = .stub()
    }
    
    override func tearDown() {
        super.tearDown()
        
        tested = nil
    }
}

// MARK: - Tests

extension SystemBeaconTests {
    
    func testEquitableFunctionFail() {
        guard let uuid = UUID(uuidString: "308b7f82-a701-11ed-afa1-0242ac120003") else { return XCTFail("Cannot create uuid") }
        
        let beacon = SystemBeaconStub(
            uuid: uuid,
            major: 1,
            minor: 1,
            proximity: .near,
            accuracy: 1,
            rssi: 1,
            beaconIdentityConstraint: .init(uuid: uuid)
        )
        
        XCTAssertFalse(SystemBeaconStub.stub() == beacon, "Should be equal")
    }
        
    func testDescriptionOk() {
        let expectedResult = "BeaconDataModel(uuid: 308B7F82-A701-11ED-AFA1-0242AC120002, major: 1, minor: 1, proximity: near, accuracy: 0.5, rssi:50)"
        
        let result = tested.description
        
        XCTAssertEqual(result, expectedResult, "Should be equal")
    }
}
