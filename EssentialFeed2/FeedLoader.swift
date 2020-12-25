//
//  FeedLoader.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/25/20.
//
enum LoadFeedResult {
    case sucess([FeedItem])
    case error(Error)
}

import Foundation
protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
