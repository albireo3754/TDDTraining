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
}
