//
//  XCTestCase+FeedImageDataLoader.swift
//  EssentialAppTests
//
//  Created by Ricardo Herrera Petit on 3/2/21.
//

import XCTest
import EssentialFeed2

protocol FeedImageDataLoaderTestCase: XCTestCase {}

extension FeedImageDataLoaderTestCase {
    func expect(_ sut: FeedImageDataLoader, toCompleteWith expectedResult: FeedImageDataLoader.Result, when action: () -> Void, file: StaticString = #file, line: UInt = #line) {
        let exp = expectation(description: "Wait for load complete")
        
        _ = sut.loadImageData(from: anyURL(), completion: { receivedResult in
            switch(receivedResult, expectedResult) {
            case let (.success(receivedFeed), .success(expectedFeed)):
                XCTAssertEqual(receivedFeed, expectedFeed, file: file, line: line)
            case (.failure, .failure):
                break
            default:
                XCTFail("Expected \(expectedResult) got \(receivedResult) instead")
            }
            exp.fulfill()
        })
        
        action()
        
        wait(for: [exp], timeout: 1.0)
    }
}
