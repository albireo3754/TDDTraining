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
    var price: Price! = nil
    
    init(title: String, priceCode: Int) {
        self.title = title
        self.setPriceCode(arg: priceCode)
    }
    
    func setPriceCode(arg: Int) {
        switch arg {
        case Movie.REGULAR:
            price = RegularPrice()
        case Movie.CHILDRENS:
            price = ChildrensPrice()
        case Movie.NEW_RELEASE:
            price = NewReleasePrice()
        default:
            break
        }
    }
    
    func getCharge(daysRented: Int) -> Double {
        return price.getCharge(daysRented: daysRented)
    }
    
    public func getFrequentRenterPoints(daysRented: Int) -> Int {
        return price.getFrequentRenterPoints(daysRented: daysRented)
    }
}
