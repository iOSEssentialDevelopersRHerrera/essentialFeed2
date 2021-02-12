//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Ricardo Herrera Petit on 2/11/21.
//

import EssentialFeed2

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
