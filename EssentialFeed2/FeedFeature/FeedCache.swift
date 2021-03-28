//
//  FeedCache.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 2/24/21.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void,Error>
    
    func save(_ feed:[FeedImage], completion: @escaping (Result)-> Void)
}
