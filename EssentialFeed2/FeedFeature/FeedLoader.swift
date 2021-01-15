//
//  FeedLoader.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/25/20.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage],Error>


public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
