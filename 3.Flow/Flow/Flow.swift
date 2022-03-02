//
//  Flow.swift
//  Flow
//
//  Created by 윤상진 on 2022/03/02.
//

import Foundation

public protocol Routerable {
    var questions: [Any] { get }
}

class Router: Routerable {
    let questions: [Any]
    
    init(questions: [Any]) {
        self.questions = questions
    }
}
