//
//  FlowTests.swift
//  FlowTests
//
//  Created by 윤상진 on 2022/03/03.
//

// https://medium.com/bootcampers/test-driven-development-simple-flow-object-in-ios-6b8a3555f495

import XCTest

class FlowTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_startWhenQuestionsEmpty_shouldNotNavigateToAnywhere() {
        // Given
        let router = RouterSpy()
        let sut = Flow(router: router, questions: [])
        
        // When
        sut.start()
        
        // Then
        XCTAssert(router.questions.isEmpty)
    }

    func test_startWhenHasOneQuestion_shouldNavigateToCorrectQuestion() {
        let router = RouterSpy()
        let sut = Flow(router: router, questions: ["Question1"])
        
        sut.start()
        
        XCTAssertEqual(router.questions, ["Question1"])
    }
    
    func test_startWhenHasTwoQuestion_shouldNavigateToFirstQuestion() {
        let router = RouterSpy()
        let sut = Flow(router: router, questions: ["Question1", "Question2"])
        
        sut.start()
        
        XCTAssertEqual(router.questions, ["Question1"])
    }
    
    func test_startWhenHasTwoQuestionsAndAnswerTheFirstQuestion_shouldNavigateTwoSecondQuestion() {
        let router = RouterSpy()
        let sut = Flow(router: router, questions: ["Question1", "Question2"])
        
        sut.start()
        router.didAnswerQuestion("Answer1")
        
        XCTAssertEqual(router.questions, ["Question1", "Question2"])
    }
    
    func test_startWhenHasThreeQuestionsAndAnswerFirstAndSecondQuestion_shouldNavigateToThirdQuestion() {
        let router = RouterSpy()
        let sut = Flow(router: router, questions: ["Question1", "Question2", "Question3"])
        
        sut.start()
        router.didAnswerQuestion("Answer1")
        router.didAnswerQuestion("Answer2")
        
        XCTAssertEqual(router.questions, ["Question1", "Question2", "Question3"])
    }
}


class RouterSpy: Routerable {
    func navigateTo(_ question: String, didAnswerQuestion: @escaping (String) -> Void) {
        questions.append(question)
        self.didAnswerQuestion = didAnswerQuestion
    }
    
    var questions: [String]
    var didAnswerQuestion: (String) -> Void = { _ in }
    init() {
        questions = []
    }
}

class Flow {
    let router: Routerable
    let questions: [String]
    
    init(router: Routerable, questions: [String]) {
        self.router = router
        self.questions = questions
    }
    
    func start() {
        guard let firstQuestion = questions.first else {
            return
        }
        
        router.navigateTo(firstQuestion, didAnswerQuestion: navigateToNextQuestion(firstQuestion))
        }
    
    private func navigateToNextQuestion(_ question: String) -> (String) -> Void {
        return { _ in
            let currentQuestionIndex = self.questions.firstIndex(of: question)!
            let nextQuestion = self.questions[currentQuestionIndex + 1]
            self.router.navigateTo(nextQuestion, didAnswerQuestion: self.navigateToNextQuestion(nextQuestion))
        }
    }
}

public protocol Routerable {
    var questions: [String] { get }
    
    func navigateTo(_ question: String, didAnswerQuestion: @escaping (String) -> Void)
}
