//
//  RouterSpy.swift
//  FlowTest
//
//  Created by 윤상진 on 2022/03/02.
//

import Foundation

class RouterSpy: Routerable {
    var questions: [Any]
    
    init() {
        questions = []
    }
}
