//
//  Province.swift
//  Province
//
//  Created by 윤상진 on 2022/03/16.
//

import Foundation

class Province {
    struct ProducerDto {
        let name: String
        let cost: Int
        var production: Int
        
        init(name: String, cost: Int, production: Int) {
            self.name = name
            self.cost = cost
            self.production = production
        }
    }
    
    internal init(name: String, producers: [ProducerDto], demand: Int, price: Int) {
        self.name = name
        self.producers = []
        self.totalProduction = 0
        self.demand = demand
        self.price = price
        producers.forEach {
            addProducer(Producer(province: self, data: $0))
        }
    }
    
    let name: String
    var producers: [Producer]
    var totalProduction: Int
    var demand: Int
    let price: Int
    
    func addProducer(_ producer: Producer) {
        producers.append(producer)
        totalProduction += producer.production
    }
    
    var shortfall: Int {
        demand - totalProduction
    }
    
    var profit: Int {
        demandValue - demandCost
    }
    
    var demandValue: Int {
        satisfiedDemand * price
    }
    
    var satisfiedDemand: Int {
        min(demand, totalProduction)
    }
    
    var demandCost: Int {
        var remainingDemand = demand
        var result = 0
        producers.sorted {
            $0.cost < $1.cost
        }
        .forEach {
            let contribution = min(remainingDemand, $0.production)
            remainingDemand -= contribution
            result += $0.cost * contribution
        }
        return result
    }
}

class Producer {
    internal init(province: Province, data: Province.ProducerDto) {
        self.name = data.name
        self.cost = data.cost
        self.province = province
        self.production = data.production
    }
    
    let name: String
    let cost: Int
    var province: Province
    var production: Int
    
    func setProduction(amountStr: String) {
        guard let amount = Int(amountStr) else { return }
        let newProduction = amount
        province.totalProduction += newProduction - production
        production = newProduction
    }
}

func sampleProvinceData() -> Province {
    Province(name: "Asia", producers: [Province.ProducerDto(name: "Byzantium", cost: 10, production:9), Province.ProducerDto(name: "Attalia", cost: 12, production: 10), Province.ProducerDto(name: "Sinope", cost: 10, production: 6)], demand: 30, price: 20)
}
