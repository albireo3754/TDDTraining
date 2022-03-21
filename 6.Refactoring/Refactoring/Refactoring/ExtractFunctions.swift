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

func extractfunc(invoice: Invoice) -> (String, Int, Date) {
    var outStanding = 0
    
    print("*******************")
    print("*******고객채무********")
    print("*******************")
    
    for order in invoice.orders {
        outStanding += order.amount
    }
    
    let today = Clock.today
    invoice.dueDate = today.addingTimeInterval(30 * 3600)
    
    return (invoice.customer, outStanding, invoice.dueDate)
}

