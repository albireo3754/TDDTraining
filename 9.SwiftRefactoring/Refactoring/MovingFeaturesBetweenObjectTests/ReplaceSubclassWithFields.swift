//
//  ReplaceSubclassWithFields.swift
//  MovingFeaturesBetweenObjectTests
//
//  Created by 윤상진 on 2022/04/15.
//

import XCTest

fileprivate protocol Person {
    func isMale() -> Bool
    func getCode() -> Character
}

fileprivate class PersonFactory {
    fileprivate static func createMale() -> Person {
        return Male()
    }
    
    fileprivate static func createFemal() -> Person {
        return Female()
    }
}

fileprivate struct Male: Person {
    func isMale() -> Bool {
        true
    }
    
    func getCode() -> Character {
        "M"
    }
}

fileprivate struct Female: Person {
    func isMale() -> Bool {
        false
    }
    
    func getCode() -> Character {
        "F"
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
