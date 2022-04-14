//
//  ReplaceTypeCodewithStrategy.swift
//  MovingFeaturesBetweenObjectTests
//
//  Created by 윤상진 on 2022/04/14.
//

import XCTest

fileprivate class Employee {
    static let ENGINEER = 0
    static let SALESMAN = 1
    static let MANAGER = 2
    let type: Int
    
    init(type: Int) {
        self.type = type
    }
    
    func payAmount() -> Int {
        switch type {
        case Employee.ENGINEER:
            return 10
        case Employee.SALESMAN:
            return 10 + 10
        case Employee.MANAGER:
            return 10 + 5
        default:
            return 0
        }
    }
}

class ReplaceTypeCodewithStrategy: XCTestCase {
    func test_Employee() {
        XCTAssertEqual(Employee(type: 0).payAmount(), 10)
        XCTAssertEqual(Employee(type: 1).payAmount(), 20)
        XCTAssertEqual(Employee(type: 2).payAmount(), 15)
    }
}
