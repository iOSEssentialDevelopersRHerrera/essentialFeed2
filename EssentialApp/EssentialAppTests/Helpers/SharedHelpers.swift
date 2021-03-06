//
//  SharedHelpers.swift
//  EssentialAppTests
//
//  Created by Ricardo Herrera Petit on 2/9/21.
//

import Foundation
import EssentialFeed2

 func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

 func anyData() -> Data {
    return Data("any data".utf8)
}

 func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}


func uniqueFeed() -> [FeedImage] {
    return [FeedImage(id: UUID(), description: "any", location: "any", url: URL(string: "http://any-url.com")!)]
}
