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
        var acc = primaryForce / mass
        let primaryTime = min(Double(time), delay)
        result = 0.5 * acc * primaryTime * primaryTime
        let secondaryTime = Double(time) - delay
        if secondaryTime > 0 {
            let primaryVel = acc * delay
            acc = primaryForce * secondaryForce / mass
            result += primaryVel * secondaryTime + 0.5 * acc * secondaryTime * secondaryTime
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
