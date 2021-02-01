//
//  FeedItemsMapper.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/29/20.
//

import Foundation

internal final class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
    
    private  static var OK_200: Int { return 200}
    
    
    internal static func map(_ data:Data, from response:HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.isOK,
              let root = try? JSONDecoder().decode(Root.self, from: data)
        else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.items
        
        
    }
}
