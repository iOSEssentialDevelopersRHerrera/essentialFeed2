//
//  FeedStore.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/31/20.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed:[LocalFeedImage], timestamp:Date, completion: @escaping InsertionCompletion)
    func retrieve()
}


