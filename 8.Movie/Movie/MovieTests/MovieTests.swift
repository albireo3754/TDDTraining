//
//  MovieTests.swift
//  MovieTests
//
//  Created by 윤상진 on 2022/04/03.
//

import XCTest
@testable import Movie

class MovieTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let customer = Customer(name: "dummy")
        let titanic = Rental(movie: Movie(title: "titanic", priceCode: Movie.NEW_RELEASE), daysRented: 2)
        let starWars = Rental(movie: Movie(title: "starWars", priceCode: Movie.CHILDRENS), daysRented: 3)
        let ironman = Rental(movie: Movie(title: "ironman", priceCode: Movie.REGULAR), daysRented: 5)
        customer.addRental(titanic)
        customer.addRental(starWars)
        customer.addRental(ironman)
        XCTAssertEqual(customer.statement(), "Rental Record for dummy\n\ttitanic\t6.0\n\tstarWars\t1.5\n\tironman\t6.5\nAmount owed is 14.0\nYou earned 4 frequent renter points")
    }
}
