//
//  RepaceTempWithQueryTest.swift
//  RepaceTempWithQueryTest
//
//  Created by 윤상진 on 2022/04/08.
//

import XCTest

//func getPrice(quantity: Int, itemPrice: Int) -> Int {
//    let basePrice = quantity * itemPrice
//    let discountFactor: Double
//    if basePrice > 1000 {
//        discountFactor = 0.95
//    } else {
//        discountFactor = 0.98
//    }
//    return Int(Double(basePrice) * discountFactor)
//}

// 한번에 두개의 임시변수를 제거해선안된다.

// 1. basePrice분리
//func getPrice(quantity: Int, itemPrice: Int) -> Int {
//    let discountFactor: Double
//    if getBasePrice(quantity: quantity, itemPrice: itemPrice) > 1000 {
//        discountFactor = 0.95
//    } else {
//        discountFactor = 0.98
//    }
//    return Int(Double(getBasePrice(quantity: quantity, itemPrice: itemPrice)) * discountFactor)
//}
//
//func getBasePrice(quantity: Int, itemPrice: Int) -> Int {
//    let basePrice = quantity * itemPrice
//    return basePrice
//}

//2. discountFactor 분리
func getPrice(quantity: Int, itemPrice: Int) -> Int {
    return Int(Double(getBasePrice(quantity: quantity, itemPrice: itemPrice)) * getDiscountFactor(quantity: quantity, itemPrice: itemPrice))
}

func getDiscountFactor(quantity: Int, itemPrice: Int) -> Double {
    let discountFactor: Double
    if getBasePrice(quantity: quantity, itemPrice: itemPrice) > 1000 {
        discountFactor = 0.95
    } else {
        discountFactor = 0.98
    }
    return discountFactor
}

func getBasePrice(quantity: Int, itemPrice: Int) -> Int {
    let basePrice = quantity * itemPrice
    return basePrice
}


class RepaceTempWithQueryTest: XCTestCase {
    func test_100원짜리물건이_10개있으면_할인받아서_980원이다() throws {
        XCTAssertEqual(getPrice(quantity: 10, itemPrice: 100), 980)
    }
    
    func test_100원짜리물건이_20개있으면_할인받아서_1900원이다() throws {
        XCTAssertEqual(getPrice(quantity: 20, itemPrice: 100), 1900)
    }
}
