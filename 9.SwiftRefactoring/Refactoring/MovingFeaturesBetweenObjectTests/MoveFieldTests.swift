//
//  MoveFieldTests.swift
//  MovingFeaturesBetweenObjectTests
//
//  Created by 윤상진 on 2022/04/11.
//

import XCTest

fileprivate enum AccountType {
    case premium(Double)
    case normal(Double)
    
    // 1. interestRate에 대한 변수를 Account에서 AccountType으로 옮겼다.
    var interestRate: Double {
        switch self {
        case .premium(let rate):
            return rate
        case .normal(let rate):
            return rate
        }
    }
}

fileprivate class Account {
    let type: AccountType
    
    // 2. 자체 캡슐화 라고 표현을 했지만 extractMethod 로 봐도 될듯 -> 다시 옮기면 Inline Method임
    private var interestRate: Double {
        return type.interestRate
    }
    
    init(type: AccountType) {
        self.type = type
    }
    
    func interestForAmountDays(amount: Double, days: Int) -> Double {
        return interestRate * amount * Double(days) / 365
    }
}

class MoveFieldTests: XCTestCase {
    func test_interestForAmountDays() {
        XCTAssertEqual(Account(type: .premium(0.5)).interestForAmountDays(amount: 10, days: 365), 5)
    }
}
