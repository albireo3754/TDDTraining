//
//  FlowTest.swift
//  FlowTest
//
//  Created by 윤상진 on 2022/03/02.
//

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

}
