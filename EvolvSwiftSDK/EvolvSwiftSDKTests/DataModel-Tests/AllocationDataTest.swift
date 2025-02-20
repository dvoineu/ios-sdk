//
//  AllocationDataTest.swift
//  EvolvSwiftSDKTests
//
//  Created by Aliaksandr Dvoineu on 08.06.21.
//

import XCTest
@testable import EvolvSwiftSDK

class AllocationsDataTest: XCTestCase {

    func testCanParseAllocation() throws {
        
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "allocations", ofType: "json") else {
            fatalError("json not found") }
        
        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert json to String")
        }
        
        let jsonData = json.data(using: .utf8)!
        let allocationsData: [Allocation] = try! JSONDecoder().decode([Allocation].self, from: jsonData)
        
        XCTAssertEqual("C51EEAFC-724D-47F7-B99A-F3494357F164", allocationsData[0].userId)
        XCTAssertEqual("ff01d1516c", allocationsData[0].experimentId)
        XCTAssertEqual("5fa0fd38aae6:ff01d1516c", allocationsData[0].candidateId)
    }
}

