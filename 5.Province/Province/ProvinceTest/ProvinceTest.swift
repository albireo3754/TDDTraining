//
//  ProvinceTest.swift
//  ProvinceTest
//
//  Created by 윤상진 on 2022/03/16.
//

import XCTest
@testable import Province

class ProvinceTest: XCTestCase {
    func testExample() throws {
        let asia = sampleProvinceData()
        XCTAssertEqual(asia.shortfall, 5)
    }
}
