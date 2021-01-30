//
//  FeedImagePresenterTests.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 1/30/21.
//

import XCTest

class FeedImagePresenter {
    private let view: ViewSpy
    init(view: ViewSpy) {
        self.view = view
    }
}


class FeedImagePresenterTests: XCTestCase {
    func test_init_doesNotSendsMessagesToView() {
        
        let view = ViewSpy()
        
        _ = FeedImagePresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Feed Image Presneter does not send messages to the view")
    }
}


//MARK: - Helpers

class ViewSpy {
    let messages = [Any]()
    
}

