//
//  ExtractClassTests.swift
//  MovingFeaturesBetweenObjectTests
//
//  Created by 윤상진 on 2022/04/12.
//

import XCTest

class Person {
    let name: String
    let officeAreaCode: String
    let officeNumber: String
    let telephoneNumber = TelephoneNumber()
    
    init(name: String, officeAreaCode: String, officeNumber: String) {
        self.name = name
        self.officeAreaCode = officeAreaCode
        self.officeNumber = officeNumber
    }
    
    func getTelephoneNumber() -> String {
        return "(\(officeAreaCode))\(officeNumber)"
    }
    
}

class TelephoneNumber {
    
}

class ExtractClassTests: XCTestCase {
    
    func test_extractClass() {
        let person = Person(name: "dummy", officeAreaCode: "82", officeNumber: "01012345678")
        XCTAssertEqual(person.getTelephoneNumber(), "(82)01012345678")
    }
}
