//
//  MovieTests.swift
//  MovieTests
//
//  Created by 윤상진 on 2022/03/08.
//

import XCTest
import Movie


class MovieTests: XCTestCase {
    
    func testStatement() throws {
        // arrange
        let invoice = Invoice()
        let invoice = Invoice(customer: <#String#>, performances: <#[Peformance]#>)
        let plays = Play
        
        // act
        let result = statement(invoice: invoice, plays: plays)
        
        // assert
        let expectedResult = ""
        XCTAssertEqual(result, expectedResult)
    }
}
