//
//  FeedImageDataCache.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 3/3/21.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void,Error>
    
    func save(_ data: Data, for url:URL, completion: @escaping (Result) -> Void)
}
