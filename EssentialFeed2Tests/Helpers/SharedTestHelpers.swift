//
//  SharedTestHelpers.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 12/31/20.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
