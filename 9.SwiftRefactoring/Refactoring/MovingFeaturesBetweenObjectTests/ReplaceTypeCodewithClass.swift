//
//  ReplaceTypeCodewithClass.swift
//  MovingFeaturesBetweenObjectTests
//
//  Created by 윤상진 on 2022/04/13.
//

import XCTest

fileprivate struct Person {
    static let O = BloodGroup.O.code
    static let A = BloodGroup.A.code
    static let B = BloodGroup.B.code
    static let AB = BloodGroup.AB.code
    
    private var bloodGroup: BloodGroup
    
    func getBloodGroup() -> Int {
        return bloodGroup.code
    }
    
    mutating func setBloodGroup(_ arg: Int) {
        bloodGroup = BloodGroup.code(arg)
    }
}

struct BloodGroup {
    static let O = BloodGroup(code: 0)
    static let A = BloodGroup(code: 1)
    static let B = BloodGroup(code: 2)
    static let AB = BloodGroup(code: 3)
    private static let values = [O, A, B, AB]
    
    let code: Int
    
    static func code(_ arg: Int) -> BloodGroup {
        return values[arg]
    }
}

class ReplaceTypeCodewithClass: XCTestCase {
    func test_Person() {
        XCTAssertEqual(Person.O, 0)
        XCTAssertEqual(Person.A, 1)
        XCTAssertEqual(Person.B, 2)
        XCTAssertEqual(Person.AB, 3)
    }
}
