//
//  Customer.swift
//  Movie
//
//  Created by 윤상진 on 2022/04/03.
//

import Foundation

class Customer {
    let name: String
    private(set) var rentals: [Rental] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addRental(_ rental: Rental) {
        rentals.append(rental)
    }
    
    func statement() -> String {
        let totalAmount = 0.0
        var frequentRenterPoints = 0
        var result = "Rental Record for \(name)\n"
        for rental in rentals {
            var thisAmount = 0.0
            switch rental.movie.priceCode {
            case Movie.REGULAR:
                thisAmount += 2
                if rental.daysRented > 2 {
                    thisAmount += Double((rental.daysRented - 2)) * 1.5
                }
            case Movie.NEW_RELEASE:
                thisAmount += Double(rental.daysRented * 3)
            case Movie.CHILDRENS:
                thisAmount += 1.5
                if rental.daysRented > 3 {
                    thisAmount += Double((rental.daysRented - 3)) * 1.5
                }
            default:
                break
            }
            frequentRenterPoints += 1
            if rental.movie.priceCode == Movie.NEW_RELEASE && rental.daysRented > 1 {
                frequentRenterPoints += 1
            }
            result += "\t \(rental.movie.title) \t \(thisAmount)\n"
        }
        result += "Amount owed is \(totalAmount)\n"
        result += "You earned \(frequentRenterPoints) frequent renter points"
        return result
    }
}
