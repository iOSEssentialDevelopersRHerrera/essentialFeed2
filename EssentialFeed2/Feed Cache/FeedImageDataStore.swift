//
//  FeedImageDataStore.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 2/2/21.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?,Error>
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
