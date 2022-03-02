//
//  Router.swift
//  Flow
//
//  Created by 윤상진 on 2022/03/02.
//

import Foundation
    
class Flow {
    let router: Routerable
    let questions: [Any]
    
    init(router: Routerable, questions: [Any]) {
        self.router = router
        self.questions = questions
    }
    
    func start() {
        
    }
}
