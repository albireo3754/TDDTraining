//
//  MoveMethodTests.swift
//  MoveMethodTests
//
//  Created by 윤상진 on 2022/04/10.
//

import XCTest

enum AccountType {
    case premium
    case normal
    
    func isPremium() -> Bool {
        switch self {
        case .premium:
            return true
        case .normal:
            return false
        }
    }
}

class Account {
    internal init(type: AccountType, daysOverdrawn: Int) {
        self.type = type
        self.daysOverdrawn = daysOverdrawn
    }
    
    private let type: AccountType
    private let daysOverdrawn: Int
    
    func overdraftCharge() -> Double {
        if type.isPremium() {
            var result = 10.0
            if (daysOverdrawn > 7) {
                result += Double((daysOverdrawn - 7)) * 0.85
            }
            return result
        } else {
            return Double(daysOverdrawn) * 1.75
        }
    }
    
    func bankCharge() -> Double {
        var result = 4.5
        if (daysOverdrawn > 0) {
            result += overdraftCharge()
        }
        return result
    }
}

class MoveMethodTests: XCTestCase {
    func test_계좌가premium이고_인출날짜가8일이면() {
        XCTAssertEqual(Account(type: .premium, daysOverdrawn: 8).bankCharge(), 15.35)
    }
    
    func test_계좌가premium이고_인출날짜가7일이면() {
        XCTAssertEqual(Account(type: .premium, daysOverdrawn: 7).bankCharge(), 14.5)
    }
    
    func test_계좌가normal이고_인출날짜가8일이면() {
        XCTAssertEqual(Account(type: .normal, daysOverdrawn: 8).bankCharge(), 18.5)
    }
    
    func test_계좌가normal이고_인출날짜가7일이면() {
        XCTAssertEqual(Account(type: .normal, daysOverdrawn: 7).bankCharge(), 16.75)
    }
}
