//
//  LoadFeedFromCacheUseCaseTest.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 12/31/20.
//

import XCTest
import EssentialFeed2

class LoadFeedFromCacheUseCaseTest: XCTestCase {
    
    func test_init_doesNotMessageTheStoreUponCreation() {
        let (_, store)  = makeSUT()
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    func test_load_failsOnRetrievalError() {
        let (sut, store)  = makeSUT()
        
        sut.load() { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    func test_load_requestsCacheRetrieval() {
        let (sut, store)  = makeSUT()
        let exp = expectation(description: "Wait for load completion")
        let retrievalError = anyNSError()
        
        var receivedError:Error?
        sut.load { error in
            receivedError = error
            exp.fulfill()
        }
        store.completeRetrieval(with: retrievalError)
        wait(for: [exp], timeout: 1.0)
        
        XCTAssertEqual(receivedError as NSError? , retrievalError)
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
