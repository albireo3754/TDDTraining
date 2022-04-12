//
//  ExtractClassTests.swift
//  MovingFeaturesBetweenObjectTests
//
//  Created by 윤상진 on 2022/04/12.
//

import XCTest

class Person {
    let name: String
    let telephoneNumber = TelephoneNumber(officeAreaCode: "82" , officeNumber: "01012345678")
    
    init(name: String) {
        self.name = name
    }
    
    func getTelephoneNumber() -> String {
        return "(\(telephoneNumber.officeAreaCode))\(telephoneNumber.officeNumber)"
    }
    
}

struct TelephoneNumber {
    // 1. MoveField
    let officeAreaCode: String
    // 2. MoveField
    let officeNumber: String
}

class ExtractClassTests: XCTestCase {
    
    func test_extractClass() {
        let person = Person(name: "dummy")
        XCTAssertEqual(person.getTelephoneNumber(), "(82)01012345678")
    }
}
