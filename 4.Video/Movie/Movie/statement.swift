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

struct Peformance {
    let playID: String
    let audience: Int
}

struct Invoice {
    let customer: String
    let performances: [Peformance]
}

class Movie {
    // 메서드 추출하기 -> 진짜 단순하게 메서들를 추출함
    var plays: [String: Play] = [:]
    
    func amountFor(performance: Peformance) -> Int? {
        var result = 0
        
        switch playFor(performance).type {
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
            return nil
        }
        return result
    }

    func playFor(_ performance: Peformance) -> Play {
        return plays[performance.playID]!
    }

    func volumeCredits(_ performance: Peformance) -> Int {
        var volumeCredits = max(performance.audience - 30, 0)
        if "comedy" == playFor(performance).type {
            volumeCredits += (performance.audience / 5)
        }
        return volumeCredits
    }
    
    func usd(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .init(identifier: "en-US")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: number / 100.0))!
    }
    
    func totalVolumeCredits(_ invoice: Invoice) -> Int {
        var volumeCredits = 0
        for performance in invoice.performances {
            volumeCredits += self.volumeCredits(performance)
        }
        return volumeCredits
    }
    
    func statement(invoice: Invoice) -> String? {
        var totalAmount = 0
        var result = "청구 내역 (고객명: \(invoice.customer))\n"
        let volumeCredits = totalVolumeCredits(invoice)
        for performance in invoice.performances {
            result += "\(playFor(performance).name): \(usd(Double(amountFor(performance: performance)!))) (\(performance.audience)석)\n"
            totalAmount += amountFor(performance: performance)!
        }
        result += "총액: \(usd(Double(totalAmount)))\n"
        result += "적립 포인트: \(volumeCredits)점\n"
        return result
    }
}

