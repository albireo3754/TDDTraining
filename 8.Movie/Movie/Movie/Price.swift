//
//  Price.swift
//  Movie
//
//  Created by 윤상진 on 2022/04/04.
//

import Foundation

protocol Price {
    var priceCode: Int { get }
    
    func getCharge(daysRented: Int) -> Double
    func getFrequentRenterPoints(daysRented: Int) -> Int
}

extension Price {
    public func getFrequentRenterPoints(daysRented: Int) -> Int {
        return 1
    }
}

class ChildrensPrice: Price {
    var priceCode: Int {
        return Movie.CHILDRENS
    }
    
    public func getCharge(daysRented: Int) -> Double {
        var result = 1.5
        if daysRented > 3 {
            result += Double((daysRented - 3)) * 1.5
        }
        return result
    }
}

class NewReleasePrice: Price {
    var priceCode: Int {
        return Movie.NEW_RELEASE
    }
    
    public func getCharge(daysRented: Int) -> Double {
        var result = 0.0
        result += Double(daysRented * 3)
        return result
    }
    
    public func getFrequentRenterPoints(daysRented: Int) -> Int {
        return daysRented > 1 ? 2 : 1
    }
}

class RegularPrice: Price {
    var priceCode: Int {
        return Movie.REGULAR
    }
    
    public func getCharge(daysRented: Int) -> Double {
        var result = 2.0
        if daysRented > 2 {
            result += Double((daysRented - 2)) * 1.5
        }
        return result
    }
}
