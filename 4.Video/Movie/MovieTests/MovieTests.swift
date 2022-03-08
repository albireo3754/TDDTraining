//
//  MovieTests.swift
//  MovieTests
//
//  Created by 윤상진 on 2022/03/08.
//

import XCTest

class MovieTests: XCTestCase {
    
    func testStatement() throws {
        // arrange
        let invoice = Invoice()
        let plays = Plays()
        
        // act
        result = statement(invoice: invoice, plays: plays)
        
        // assert
        let expectedResult = Result()
        XCTAssertEqual(result, expectedResult)
    }
}
