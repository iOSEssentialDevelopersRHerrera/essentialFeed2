//
//  URLSessionHTTPClientTests.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 12/29/20.
//

import XCTest

class URLSessionHTTPClient {
    private let session:URLSession
    
    init(session:URLSession) {
        self.session = session
    }
    
    func get(from url:URL) {
        session.dataTask(with: url)
    }
}

class URLSessionHTTPClientTests: XCTestCase {
    func test_getFromURL_createDataTaskWithURL() {
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)
        
        sut.get(from: url)
        
        XCTAssertEqual(session.receivedURLs, [url])
    }
    
    //MARK: - Helpers 
    private class URLSessionSpy:URLSession {
        var receivedURLs = [URL]()
        
        override func dataTask(with url: URL) -> URLSessionDataTask {
            receivedURLs.append(url)
            return FakeURLSessionDataTask()
        }
    }
    
    private class FakeURLSessionDataTask: URLSessionDataTask {}
}
