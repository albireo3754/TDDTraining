//
//  TestMovie.swift
//  TestMovie
//
//  Created by 윤상진 on 2022/03/09.
//

import XCTest
@testable import SwiftMovie

class TestMovie: XCTestCase {

    func test_Statement() throws {
        // arrange
        
        let hamlet = Play(name: "Hamlet", type: "tragedy")
        let aslike = Play(name: "As You Like it", type: "comedy")
        let othello = Play(name: "Othello", type: "tragedy")
        let plays = ["hamlet": hamlet, "as-like": aslike, "othello": othello]
        let performances = [Peformance(playID: "hamlet", audience: 55),
                            Peformance(playID: "as-like", audience: 35),
                            Peformance(playID: "othello", audience: 40)]
        let invoices = Invoice(customer: "BigCo", performances: performances)
        
        // act
        let result = statement(invoice: invoices, plays: plays)
        
        // assert
        let expectedResult = ""
        XCTAssertEqual(result, expectedResult)
    }
}
