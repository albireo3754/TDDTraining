//
//  ExtractFunctions.swift
//  Refactoring
//
//  Created by 윤상진 on 2022/03/21.
//

import Foundation

class Invoice {
    internal init(customer: String, orders: [Order]) {
        self.customer = customer
        self.orders = orders
    }
    let customer: String
    let orders: [Order]
    var dueDate: Date = Date()
}

struct Order {
    let amount: Int
}

struct Clock {
    static var today: Date {
        #if DEBUG
        return Date(timeIntervalSince1970: 0)
        #endif
        return Date()
    }
}

func printBanner() {
    print("*******************")
    print("*******고객채무********")
    print("*******************")
}

fileprivate func recordDueData(_ invoice: Invoice) {
    let today = Clock.today
    invoice.dueDate = today.addingTimeInterval(30 * 3600)
}

func extractfunc(invoice: Invoice) -> (String, Int, Date) {
    printBanner()
    
    let outStanding = calcuateOutstanding(invoice)
    
    recordDueData(invoice)
    
    return (invoice.customer, outStanding, invoice.dueDate)
}

func calcuateOutstanding(_ invoice: Invoice) -> Int {
    var outStanding = 0
    for order in invoice.orders {
        outStanding += order.amount
    }
    return outStanding
}

func getRating(driver: Int) -> Int {
    return driver > 5 ? 2: 1
}

