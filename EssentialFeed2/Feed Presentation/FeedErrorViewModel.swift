//
//  FeedErrorViewModel.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 1/30/21.
//

import Foundation

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
