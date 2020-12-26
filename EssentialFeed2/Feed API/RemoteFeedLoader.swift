//
//  RemoteFeedLoader.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/25/20.
//

import Foundation

public protocol HTTPClient {
    func get(from url:URL)
}


public final class RemoteFeedLoader {
    private let url:URL
    private let client:HTTPClient
 
   
    public init(url:URL, client:HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        client.get(from: url)
    }
}
