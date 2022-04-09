//
//  SplitTemporaryVariable.swift
//  ComposingMethodTests
//
//  Created by 윤상진 on 2022/04/09.
//

import XCTest

class STV {
    let mass = 1.0
    let primaryForce = 1.0
    let secondaryForce = 1.0
    let delay = 1.0
    
    func getDistanceTravelled(time: Int) -> Double {
        var result: Double
        // 1. 임시변수의 이름을 변경하고 final하게 변경한다.
        let primaryAcc = primaryForce / mass
        let primaryTime = min(Double(time), delay)
        result = 0.5 * primaryAcc * primaryTime * primaryTime
        let secondaryTime = Double(time) - delay
        if secondaryTime > 0 {
            let primaryVel = primaryAcc * delay
            // 2. 여기도 임시 변수의 이름을 바꿔서 명확도를 증가시켰다.
            let secondaryAcc = primaryForce * secondaryForce / mass
            result += primaryVel * secondaryTime + 0.5 * secondaryAcc * secondaryTime * secondaryTime
        }
        return result
    }
}

class SplitTemporaryVariable: XCTestCase {
    func test_1초에_이동한거리는50cm다() throws {
        XCTAssertEqual(STV().getDistanceTravelled(time: 1), 0.5)
    }
    
    func test_2초에_이동한거리는2m이다() throws {
        XCTAssertEqual(STV().getDistanceTravelled(time: 2), 2)
    }
}
