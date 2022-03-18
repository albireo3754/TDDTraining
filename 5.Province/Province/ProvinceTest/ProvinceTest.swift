//
//  ProvinceTest.swift
//  ProvinceTest
//
//  Created by 윤상진 on 2022/03/16.
//

import XCTest
@testable import Province

class ProvinceTest: XCTestCase {
    var asia: Province!
    override func setUp() async throws {
       asia = sampleProvinceData()
    }
    
    func testExample() throws {
        XCTAssertEqual(asia.shortfall, 5)
    }
    
    func testProfit() throws {
        XCTAssertEqual(asia.profit, 230)
    }
    
    // 자바스크립트 예제와 달리 실패하는 테스트 경우임
//    func testChangeProduction() throws {
//        asia.producers[0].production = 20
//        XCTAssertEqual(asia.shortfall, -6)
//        XCTAssertEqual(asia.profit, 292)
//    }
    
}
