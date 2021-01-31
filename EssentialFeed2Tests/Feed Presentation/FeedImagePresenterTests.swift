//
//  FeedImagePresenterTests.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 1/30/21.
//

import XCTest


final class FeedImagePresenter {
    init(view: Any) {
        
    }
}


class FeedImagePresenterTests: XCTestCase {
    func test_init_doesNotSendsMessagesToView() {
        
        let view = ViewSpy()
        
        _ = FeedImagePresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Feed Image Presneter does not send messages to the view")
    }
    
    //MARK: - Helpers

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (sut: FeedImagePresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedImagePresenter(view: view)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(view, file: file, line: line)
        return (sut, view)
       
    }
    
    private class ViewSpy {
        let messages = [Any]()
        
    }
   
}






