//
//  Movie.swift
//  Movie
//
//  Created by 윤상진 on 2022/04/03.
//

import Foundation

public class Movie {
    static let CHILDRENS = 2
    static let REGULAR = 0
    static let NEW_RELEASE = 1
    
    let title: String
    var priceCode: Int
    
    init(title: String, priceCode: Int) {
        self.title = title
        self.priceCode = priceCode
    }
    
    public func getCharge(daysRented: Int) -> Double {
        var result = 0.0
        switch priceCode {
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
    
    public func getFrequentRenterPoints(daysRented: Int) -> Int {
        var frequentRenterPoints = 1
        if priceCode == Movie.NEW_RELEASE && daysRented > 1 {
            frequentRenterPoints += 1
        }
        return frequentRenterPoints
    }
}
