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

// 메서드 추출하기 -> 진짜 단순하게 메서들를 추출함
func amountFor(performance: Peformance, play: Play) -> Int? {
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
        return nil
    }
    return result
}

func playFor(_ plays: [String : Play], _ performance: Peformance) -> Play {
    return plays[performance.playID]!
}

func statement(invoice: Invoice, plays: [String: Play]) -> String? {
    var totalAmount = 0;
    var volumeCredits = 0;
    var result = "청구 내역 (고객명: \(invoice.customer))\n"
    let format: (Double) -> String = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .init(identifier: "en-US")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: $0))!
    }
    for performance in invoice.performances {
        // 변수 인라인하기
        let thisAmount = amountFor(performance: performance, play: playFor(plays, performance))!
        volumeCredits += max(performance.audience - 30, 0)
        if "comedy" == playFor(plays, performance).type {
            volumeCredits += (performance.audience / 5)
        }
        result += "\(playFor(plays, performance).name): \(format(Double(thisAmount/100))) (\(performance.audience)석)\n"
        totalAmount += thisAmount
    }
    result += "총액: \(format(Double(totalAmount/100)))\n"
    result += "적립 포인트: \(volumeCredits)점\n"
    return result
}
