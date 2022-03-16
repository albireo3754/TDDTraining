//
//  Province.swift
//  Province
//
//  Created by 윤상진 on 2022/03/16.
//

import Foundation

struct Province {
    let name: String
    let producers: [Producer]
    let totalProduction: Int
    let demand: Int
    let price: Int
    
    func addProducer() {
        
    }
}

struct Producer {
    let name: String
    let cost: Int
    let production: Int
}

func sampleProvinceData() -> Province {
    Province(name: "Asia", producers: [Producer(name: "Byzantium", cost: 10, production:9), Producer(name: "Attalia", cost: 12, production: 10), Producer(name: "Sinope", cost: 10, production: 6)], totalProduction: 0, demand: 30, price: 20)
}
