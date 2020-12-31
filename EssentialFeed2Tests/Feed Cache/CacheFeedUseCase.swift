//
//  CacheFeedUseCase.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 12/31/20.
//

import XCTest
import EssentialFeed2

class LocalFeedLoader {
    private var store:FeedStore
    
    init(store:FeedStore) {
        self.store = store
    }
    
    func save(_ items:[FeedItem]) {
        store.deleteCachedFeed()
    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
    
    func deleteCachedFeed() {
        deleteCachedFeedCallCount += 1
    }
}

class CacheFeeduseCase: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let (_, store)  = makeSUT()
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
    
    func test_save_requestsCacheDeletion() {
        let (sut, store)  = makeSUT()
        
        let items = [uniqueItem(), uniqueItem()]
        sut.save(items)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 1)
    }
    
    //MARK: -Helpers
    
    private func makeSUT(file: StaticString = #file, line:UInt = #line) -> (sut: LocalFeedLoader, store: FeedStore) {
        let store = FeedStore()
        let sut  = LocalFeedLoader(store: store)
        trackForMemoryLeaks(store,file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
    func uniqueItem() ->FeedItem {
        return FeedItem(id: UUID(), description: "any", location: "any", imageURL: anyURL())
    }
}
