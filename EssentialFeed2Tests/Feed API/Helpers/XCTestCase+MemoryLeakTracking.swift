//
//  XCTestCase+MemoryLeakTracking.swift
//  EssentialFeed2Tests
//
//  Created by Ricardo Herrera Petit on 12/29/20.
//

import XCTest

extension XCTestCase {
     func trackForMemoryLeaks(_ instance:AnyObject, file: StaticString = #file, line:UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak", file: file, line:line)
        }
    }
}
