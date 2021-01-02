//
//  ValidateFeedCacheUseCaseTest.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 1/1/21.
//

import XCTest
import EssentialFeed2

class ValidateFeedCacheUseCaseTest: XCTestCase {
    
    func test_init_doesNotMessageTheStoreUponCreation() {
        let (_, store)  = makeSUT()
        
        
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    //MARK: -Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line:UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut  = LocalFeedLoader(store: store, currentDate:currentDate)
        trackForMemoryLeaks(store,file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
    
}