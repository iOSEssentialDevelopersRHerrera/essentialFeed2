//
//  FeedErrorViewModel.swift
//  Essentialfeed2iOS
//
//  Created by Ricardo Herrera Petit on 1/29/21.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
