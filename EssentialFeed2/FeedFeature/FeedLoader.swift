//
//  FeedLoader.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/25/20.
//
public enum LoadFeedResult{
    case success([FeedItem])
    case failure(Error)
}


import Foundation
protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
