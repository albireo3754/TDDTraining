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
        var totalAmount = 0.0
        var frequentRenterPoints = 0
        var result = "Rental Record for \(name)\n"
        for rental in rentals {
            let thisAmount = amountFor(rental)
            frequentRenterPoints += 1
            if rental.movie.priceCode == Movie.NEW_RELEASE && rental.daysRented > 1 {
                frequentRenterPoints += 1
            }
            result += "\t\(rental.movie.title)\t\(thisAmount)\n"
            totalAmount += thisAmount
        }
        result += "Amount owed is \(totalAmount)\n"
        result += "You earned \(frequentRenterPoints) frequent renter points"
        return result
    }
    
    private func amountFor(_ rental: Rental) -> Double {
        return rental.getCharge()
    }
}
