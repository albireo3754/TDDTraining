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

func printOwing() {
    printBanner()
    let amount = 1.0
    printAmount(amount)
}
