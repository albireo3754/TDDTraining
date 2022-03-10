//
//  MovieTest.swift
//  MovieTests
//
//  Created by 윤상진 on 2022/03/09.
//

import XCTest
@testable import Movie

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
        let expectedResult = "청구 내역 (고객명: BigCo)\nHamlet: $650.00 (55석)\nAs You Like it: $580.00 (35석)\nOthello: $500.00 (40석)\n총액: $1,730.00\n적립 포인트: 47점\n"
        XCTAssertEqual(result, expectedResult)
    }
}
