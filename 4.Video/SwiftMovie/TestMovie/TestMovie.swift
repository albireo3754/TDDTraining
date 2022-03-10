//
//  TestMovie.swift
//  TestMovie
//
//  Created by 윤상진 on 2022/03/09.
//

import XCTest
class Test {
    var hi2 = 3
    var hi: Int {
        var num = hi2 + 1
        return num
    }
}

class TestMovie: XCTestCase {
    
    func test_Test() throws {
        let test = Test()
        XCTAssertEqual(test.hi, 4)
        test.hi2 = 7
        XCTAssertEqual(test.hi, 8)
    }

}
