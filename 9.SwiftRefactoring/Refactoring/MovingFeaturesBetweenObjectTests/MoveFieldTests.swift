//
//  MoveFieldTests.swift
//  MovingFeaturesBetweenObjectTests
//
//  Created by 윤상진 on 2022/04/11.
//

import XCTest

fileprivate enum AccountType {
    case premium
    case normal
}

fileprivate class Account {
    let type: AccountType
    let interestRate: Double
    
    init(type: AccountType, interestRate: Double) {
        self.type = type
        self.interestRate = interestRate
    }
    
    func interestForAmountDays(amount: Double, days: Int) -> Double {
        return interestRate * amount * Double(days) / 365
    }
}

class MoveFieldTests: XCTestCase {
    func test_interestForAmountDays() {
        XCTAssertEqual(Account(type: .premium, interestRate: 0.5).interestForAmountDays(amount: 10, days: 365), 5)
    }
}
