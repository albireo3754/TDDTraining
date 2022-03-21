//
//  RefactoringTests.swift
//  RefactoringTests
//
//  Created by 윤상진 on 2022/03/21.
//

import XCTest
@testable import Refactoring

class RefactoringTest: XCTestCase {
    func testExtractFunction() throws {
        let detail = extractfunc(invoice: Invoice(orders: [Order(amount: 1)]))
        XCTAssertEqual(detail.0, "dummy")
        XCTAssertEqual(detail.1, 1)
        XCTAssertEqual(detail.2, Date(timeIntervalSince1970: 0))
    }
}

