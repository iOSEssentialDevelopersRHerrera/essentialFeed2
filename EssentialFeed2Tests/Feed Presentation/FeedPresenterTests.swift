//
//  FeedPresenterTests.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 1/29/21.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendsMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    //MARK: - Helpers
    
    private class ViewSpy {
        let messages = [Any]()
    }
    
}
