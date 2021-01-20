//
//  RemoteFeedItem.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/31/20.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id:UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
