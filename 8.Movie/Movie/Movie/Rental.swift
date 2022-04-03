//
//  Rental.swift
//  Movie
//
//  Created by 윤상진 on 2022/04/03.
//

import Foundation

public class Rental {
    var movie: Movie
    var daysRented: Int
    
    init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }
    
    public func getCharge() -> Double {
        var result = 0.0
        switch movie.priceCode {
        case Movie.REGULAR:
            result += 2
            if daysRented > 2 {
                result += Double((daysRented - 2)) * 1.5
            }
        case Movie.NEW_RELEASE:
            result += Double(daysRented * 3)
        case Movie.CHILDRENS:
            result += 1.5
            if daysRented > 3 {
                result += Double((daysRented - 3)) * 1.5
            }
        default:
            break
        }
        return result
    }
    
    public func getFrequentRenterPoints() -> Int {
        var frequentRenterPoints = 1
        if movie.priceCode == Movie.NEW_RELEASE && daysRented > 1 {
            frequentRenterPoints += 1
        }
        return frequentRenterPoints
    }
}
