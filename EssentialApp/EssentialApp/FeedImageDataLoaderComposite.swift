//
//  FeedImageDataLoaderComposite.swift
//  EssentialApp
//
//  Created by Ricardo Herrera Petit on 2/9/21.
//

import Foundation
import EssentialFeed2

public class FeedImageDataLoaderComposite: FeedImageDataLoader {
   
    private let primary: FeedImageDataLoader
    private let fallback: FeedImageDataLoader
    
    private class TaskWrapper: FeedImageDataLoaderTask {
        var wrapped: FeedImageDataLoaderTask?
        func cancel() {
            wrapped?.cancel()
        }
    }
    
    public init(primary: FeedImageDataLoader, fallback: FeedImageDataLoader) {
        self.primary = primary
        self.fallback = fallback
    }
    
    public func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        let task = TaskWrapper()
        task.wrapped = primary.loadImageData(from: url) { [weak self] result in
            switch result {
            case .success:
                completion(result)
            case .failure:
                task.wrapped = self?.fallback.loadImageData(from: url, completion: completion)
            }
        }
        return task
    }
}
