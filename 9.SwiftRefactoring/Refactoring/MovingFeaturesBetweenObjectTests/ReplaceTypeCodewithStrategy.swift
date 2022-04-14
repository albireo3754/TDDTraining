//
//  ReplaceTypeCodewithStrategy.swift
//  MovingFeaturesBetweenObjectTests
//
//  Created by 윤상진 on 2022/04/14.
//

import XCTest

fileprivate class Employee {
    let type: Int
    
    init(type: Int) {
        self.type = type
    }
    
    func payAmount() -> Int {
        // 1. EmployeeType으로 일단 코드 변경
        switch type {
        case Engineer.ENGINEER:
            return 10
        case Salesman.SALESMAN:
            return 10 + 10
        case Manager.MANAGER:
            return 10 + 5
        default:
            return 0
        }
    }
}

fileprivate protocol EmployeeType {
    static var ENGINEER: Int { get }
    static var SALESMAN: Int { get }
    static var MANAGER: Int { get }
    
    func getTypeCode() -> Int
}

fileprivate extension EmployeeType {
    static var ENGINEER: Int { 0 }
    static var SALESMAN: Int { 1 }
    static var MANAGER: Int { 2 }
    
    static func newType(code: Int) -> EmployeeType {
        switch code {
        case ENGINEER:
            return Engineer()
        case SALESMAN:
            return Salesman()
        case MANAGER:
            return Manager()
        default:
            fatalError()
        }
    }
}

fileprivate struct Engineer: EmployeeType {
    func getTypeCode() -> Int {
        return 0
    }
}

fileprivate struct Salesman: EmployeeType {
    func getTypeCode() -> Int {
        return 1
    }
}

fileprivate struct Manager: EmployeeType {
    func getTypeCode() -> Int {
        return 2
    }
}

//fileprivate class EmployeeType {
//    
//    
//    static func newType(code: Int) -> EmployeeType {
//        switch code {
//        case ENGINEER:
//            return
//        }
//    }
//}

class ReplaceTypeCodewithStrategy: XCTestCase {
    func test_Employee() {
        XCTAssertEqual(Employee(type: 0).payAmount(), 10)
        XCTAssertEqual(Employee(type: 1).payAmount(), 20)
        XCTAssertEqual(Employee(type: 2).payAmount(), 15)
    }
}
