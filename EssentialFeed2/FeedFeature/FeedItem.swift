//
//  FeedItem.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/25/20.
//

import Foundation

public struct FeedItem: Equatable {
    let id:UUID
    let description: String?
    let location: String?
    let imageURL: URL 
}
