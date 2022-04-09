//
//  IntroduceExplainingVariableTest.swift
//  ComposingMethodTests
//
//  Created by 윤상진 on 2022/04/09.
//

import XCTest

class IntroduceExplainingVariable {
    let quantity: Int
    let itemPrice: Int
    
    init(quantity: Int, itemPrice: Int) {
        self.quantity = quantity
        self.itemPrice = itemPrice
    }
    
    func price() -> Double {
        let basePrice: Double = Double(quantity * itemPrice)
        return basePrice - Double(max(0, quantity - 500) * itemPrice) * 0.05 + min(basePrice * 0.1, 100.0)
    }
}


class IntroduceExplainingVariableTest: XCTestCase {

    func test_10원짜리아이템을_10개를구매하면_110원이다() throws {
        XCTAssertEqual(IntroduceExplainingVariable(quantity: 10, itemPrice: 10).price(), 110)
    }
    
    func test_10원짜리아이템을_200개를구매하면_2100원이다() throws {
        XCTAssertEqual(IntroduceExplainingVariable(quantity: 200, itemPrice: 10).price(), 2100)
    }
    
    func test_10원짜리아이템을_1000개구매하면_9850원이다() throws {
        XCTAssertEqual(IntroduceExplainingVariable(quantity: 1000, itemPrice: 10).price(), 9850)
    }
}

