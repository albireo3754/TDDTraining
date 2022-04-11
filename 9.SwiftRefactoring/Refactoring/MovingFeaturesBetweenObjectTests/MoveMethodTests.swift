//
//  MoveMethodTests.swift
//  MoveMethodTests
//
//  Created by 윤상진 on 2022/04/10.
//

import XCTest

fileprivate enum AccountType {
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
    
    // 1. 타겟클래스로 옮기고 소스 객체의 변수를 파라미터로 넘겼다.
    func overdraftCharge(daysOverdrawn: Int) -> Double {
        if isPremium() {
            var result = 10.0
            if (daysOverdrawn > 7) {
                result += Double((daysOverdrawn - 7)) * 0.85
            }
            return result
        } else {
            return Double(daysOverdrawn) * 1.75
        }
    }
}

fileprivate class Account {
    internal init(type: AccountType, daysOverdrawn: Int) {
        self.type = type
        self.daysOverdrawn = daysOverdrawn
    }
    
    private let type: AccountType
    private let daysOverdrawn: Int
    
    // 2. 타겟 클래스에 알맞은 로직을 위임하였다.
//    func overdraftCharge() -> Double {
//        return type.overdraftCharge(daysOverdrawn: daysOverdrawn)
//    }
    
    // 3. 이렇게 줄인 메소드를 Inline Method 방법으로 리팩토링 하였다.
    func bankCharge() -> Double {
        var result = 4.5
        if (daysOverdrawn > 0) {
            result += type.overdraftCharge(daysOverdrawn: daysOverdrawn)
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
