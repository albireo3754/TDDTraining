//
//  RepaceTempWithQueryTest.swift
//  RepaceTempWithQueryTest
//
//  Created by 윤상진 on 2022/04/08.
//

import XCTest

func getPrice(quantity: Int, itemPrice: Int) -> Int {
    let basePrice = quantity * itemPrice
    let discountFactor: Double
    if basePrice > 1000 {
        discountFactor = 0.95
    } else {
        discountFactor = 0.98
    }
    return Int(Double(basePrice) * discountFactor)
}

class RepaceTempWithQueryTest: XCTestCase {
    func test_100원짜리물건이_10개있으면_할인받아서_980원이다() throws {
        XCTAssertEqual(getPrice(quantity: 10, itemPrice: 100), 980)
    }
    
    func test_100원짜리물건이_20개있으면_할인받아서_1900원이다() throws {
        XCTAssertEqual(getPrice(quantity: 20, itemPrice: 100), 1900)
    }
}
