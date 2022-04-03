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
        return movie.getCharge(daysRented: daysRented)
    }
    
    public func getFrequentRenterPoints() -> Int {
        return movie.getFrequentRenterPoints(daysRented: daysRented)
    }
}
