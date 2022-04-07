//
//  Main.swift
//  Movie
//
//  Created by 윤상진 on 2022/04/03.
//

import Foundation

func printBanner() {
    print("--------")
    print("-Banner-")
    print("--------")
}

func printAmount(_ amount: Double) {
    print("amount" + "\(amount)")
}

func calculateAmount() -> Double {
    var amount = 1.0
    for i in 1...5 {
        amount += Double(i)
    }
    return amount
}

func printOwing() {
    printBanner()
//    var amount = 1.0
//    for i in 1...5 {
//        amount += Double(i)
//    }
    var amount = calculateAmount()
    printAmount(amount)
}
