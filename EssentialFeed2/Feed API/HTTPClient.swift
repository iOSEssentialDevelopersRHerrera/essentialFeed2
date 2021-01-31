//
//  HTTPClient.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/29/20.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data,HTTPURLResponse),Error>
    ///The Completion handler can be invoked in any thread.
    /// Clients are responsible to appropiate threads , if needed
    @discardableResult
    func get(from url:URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
