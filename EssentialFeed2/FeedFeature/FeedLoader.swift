//
//  FeedLoader.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/25/20.
//
public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

extension LoadFeedResult:Equatable where Error:Equatable { }

import Foundation
protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
