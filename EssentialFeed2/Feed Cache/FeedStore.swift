//
//  FeedStore.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/31/20.
//

import Foundation



public typealias CachedFeed = (feed:[LocalFeedImage], timestamp:Date)
    
public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    typealias RetrievalResult = Result<CachedFeed?,Error>
    typealias RetrievalCompletion = (RetrievalResult) -> Void
    
    ///The Completion handler can be invoked in any thread.
    /// Clients are responsible to appropiate threads , if needed
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    
    ///The Completion handler can be invoked in any thread.
    /// Clients are responsible to appropiate threads , if needed
    func insert(_ feed:[LocalFeedImage], timestamp:Date, completion: @escaping InsertionCompletion)
    
    ///The Completion handler can be invoked in any thread.
    /// Clients are responsible to appropiate threads , if needed
    func retrieve(completion: @escaping RetrievalCompletion)
}


