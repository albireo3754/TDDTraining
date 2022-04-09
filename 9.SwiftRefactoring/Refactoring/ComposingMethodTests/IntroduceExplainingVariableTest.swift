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
    
    // 3. Introduce Explaining Variable로 분리한 변수를 ExtractMethod로 다시 변환함
    // 물론 여기서 이해가 더 잘되는 로직으로 변경되는 경우가 생긴가면 ReplaceTemp with Query를 적용한다.
    fileprivate func getBasePrice() -> Double {
        return Double(quantity * itemPrice)
    }
    
    fileprivate func getQuantityDiscount() -> Double {
        return Double(max(0, quantity - 500) * itemPrice) * 0.05
    }
    
    fileprivate func getShipping() -> Double {
        return min(getBasePrice() * 0.1, 100.0)
    }
    
    func price() -> Double {
        let basePrice: Double = getBasePrice()
        // 1. quantityDiscount를 도입한다.
        let quantityDiscount = getQuantityDiscount()
        // 2. shipping을 도입한다.
        let shipping = getShipping()
        return basePrice - quantityDiscount + shipping
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

