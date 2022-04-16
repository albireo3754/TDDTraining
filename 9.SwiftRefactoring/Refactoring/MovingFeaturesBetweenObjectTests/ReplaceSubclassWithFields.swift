//
//  ReplaceSubclassWithFields.swift
//  MovingFeaturesBetweenObjectTests
//
//  Created by 윤상진 on 2022/04/15.
//

import XCTest

fileprivate struct Person {
    private let code: Character
    
    init(code: Character) {
        self.code = code
    }
    
    func isMale() -> Bool {
        return code == "M"
    }
    func getCode() -> Character {
        return code
    }
}

fileprivate class PersonFactory {
    fileprivate static func createMale() -> Person {
        return Person(code: "M")
    }
    
    fileprivate static func createFemal() -> Person {
        return Person(code: "F")
    }
}

class ReplaceSubclassWithFields: XCTestCase {
    func test_Male() {
        let male: Person = PersonFactory.createMale()
        XCTAssertEqual(male.getCode(), "M")
        XCTAssertEqual(male.isMale(), true)
    }
    
    func test_Female() {
        let female: Person = PersonFactory.createFemal()
        XCTAssertEqual(female.getCode(), "F")
        XCTAssertEqual(female.isMale(), false)
    }
}
