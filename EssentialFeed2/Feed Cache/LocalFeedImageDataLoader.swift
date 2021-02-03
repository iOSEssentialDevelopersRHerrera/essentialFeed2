//
//  LocalFeedImageDataLoader.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 2/2/21.
//

import Foundation

public final class LocalFeedImageDataLoader {
    
    private let store: FeedImageDataStore
    
    public init(store: FeedImageDataStore) {
        self.store = store
    }
    
    public enum Error: Swift.Error {
        case failed
        case notFound
    }
    
    
    private final class Task: FeedImageDataLoaderTask{
        private var completion: ((FeedImageDataLoader.Result) -> Void)?
        
        public init(_ completion: @escaping (FeedImageDataLoader.Result) -> Void) {
            self.completion = completion
        }
        
        func complete(with result: FeedImageDataLoader.Result) {
            completion?(result)
        }
        
        func cancel() {
            preventFurtherCompletions()
        }
        
        private func preventFurtherCompletions() {
            completion = nil
        }
    }
    
    public func loadImageData(from url:URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        let task = Task(completion)
        store.retrieve(dataForURL: url) { [ weak self] result in
            guard self != nil else { return }
            task.complete(with: result
                            .mapError{ _ in Error.failed }
                            .flatMap{ data in data.map{ .success($0)} ?? .failure(Error.notFound)})
        }
        return task
    }
}
