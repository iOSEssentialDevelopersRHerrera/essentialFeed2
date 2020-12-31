//
//  CacheFeedUseCase.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 12/31/20.
//

import XCTest

class LocalFeedLoader {
    private var store:FeedStore
    
    init(store:FeedStore) {
        self.store = store
    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
}

class CacheFeeduseCase: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
