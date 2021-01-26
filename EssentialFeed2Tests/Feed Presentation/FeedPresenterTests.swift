//
//  FeedPresenterTests.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 1/25/21.
//

import XCTest

final class FeedPresenter {
    init(view:Any) {
        
    }
}

class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no vie messages")
    }
    
    //MARK: -Helpers
    
    private class ViewSpy {
        let messages = [Any]()
    }
}
