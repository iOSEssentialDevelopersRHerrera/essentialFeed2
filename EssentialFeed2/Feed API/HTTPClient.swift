//
//  HTTPClient.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 12/29/20.
//

import Foundation

public enum HTTPClientResult {
    case success(Data,HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    ///The Completion handler can be invoked in any thread.
    /// Clients are responsible to appropiate threads , if needed
    
    func get(from url:URL, completion: @escaping (HTTPClientResult) -> Void)
}
