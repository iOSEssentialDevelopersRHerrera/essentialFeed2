//
//  RemoteFeedLoaderTests.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 12/25/20.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotrequestDataFromURL() {
        
        let client = HTTPClient()
        _ = RemoteFeedLoader()

        
        XCTAssertNil(client.requestedURL)
    }
}
