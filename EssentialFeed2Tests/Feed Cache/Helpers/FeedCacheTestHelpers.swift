//
//  FeedCacheTestHelpers.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 1/1/21.
//

import Foundation
import EssentialFeed2

func uniqueImage() ->FeedImage {
    return FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage] ) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    return (models, local)
}

public extension Date {
    func adding(days:Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to:self)!
    }
    
    func adding(seconds:TimeInterval) -> Date {
        return self + seconds
    }
}
