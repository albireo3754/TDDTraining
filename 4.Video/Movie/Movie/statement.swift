//
//  main.swift
//  SwiftMovie
//
//  Created by 윤상진 on 2022/03/09.
//

import Foundation

struct Play {
    let name: String
    let type: String
}

struct Performance {
    let playID: String
    let audience: Int
}

struct Invoice {
    let customer: String
    let performances: [Performance]
}

class PerformanceCalculator {
    let performance: Performance
    let play: Play
    
    init(performance: Performance, play: Play) {
        self.performance = performance
        self.play = play
    }
    
    var amount: Int {
        var result = 0
        
        switch play.type {
        case "tragedy":
            result = 40000
            if (performance.audience > 30) {
                result += 1000 * (performance.audience - 30)
            }
        case "comedy":
            result = 30000
            if (performance.audience > 20) {
                result += 10000 + 500 * (performance.audience - 20)
            }
            result += 300 * performance.audience
        default:
            break
        }
        return result
    }
    
    var volumeCredit: Int {
        var volumeCredit = max(performance.audience - 30, 0)
        if "comedy" == play.type {
            volumeCredit += (performance.audience / 5)
        }
        return volumeCredit
    }
}

class Movie {
    struct StatementData {
        struct Performance {
            let play: Play
            let amount: Int
            let audience: Int
            let volumeCredit: Int
        }
        var customer = ""
        var performances = [Performance]()
        var totalAmount: Int = 0
        var totalVolumeCredits: Int = 0
    }
    // 메서드 추출하기 -> 진짜 단순하게 메서들를 추출함
    var plays: [String: Play] = [:]

    func playFor(_ performance: Performance) -> Play {
        return plays[performance.playID]!
    }
    
    func usd(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .init(identifier: "en-US")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: Double(number) / 100.0))!
    }
    
    func totalVolumeCredits(_ performances: [StatementData.Performance]) -> Int {
        return performances.reduce(0) { $0 + $1.volumeCredit }
    }
    
    func totalAmount(_ performances: [StatementData.Performance]) -> Int {
        return performances.reduce(0) { $0 + $1.amount }
    }
    
    func enrichPerformance(_ performance: Performance) -> StatementData.Performance {
        let calculator = PerformanceCalculator(performance: performance, play: playFor(performance))
        let play = calculator.play
        let amount = calculator.amount
        let audience = performance.audience
        let volumeCredit = calculator.volumeCredit
        return StatementData.Performance(play: play, amount: amount, audience: audience, volumeCredit: volumeCredit)
    }
    
    func statement(invoice: Invoice) -> String? {
        let customer = invoice.customer
        let performances = invoice.performances.map(enrichPerformance)
        let totalAmount = totalAmount(performances)
        let totalVolueCredits = totalVolumeCredits(performances)
        var statementData = StatementData(customer: customer,
                                          performances: performances,
                                          totalAmount: totalAmount,
                                          totalVolumeCredits: totalVolueCredits)
        return renderPlainText(statementData)
    }
    
    func renderPlainText(_ statementData: StatementData) -> String? {
        var result = "청구 내역 (고객명: \(statementData.customer))\n"
        for performance in statementData.performances {
            result += "\(performance.play.name): \(usd(performance.amount)) (\(performance.audience)석)\n"
        }
        result += "총액: \(usd(statementData.totalAmount))\n"
        result += "적립 포인트: \(statementData.totalVolumeCredits)점\n"
        return result
    }
}

