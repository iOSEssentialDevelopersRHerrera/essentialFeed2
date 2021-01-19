//
//  FeedViewModel.swift
//  Essentialfeed2iOS
//
//  Created by Ricardo Herrera Petit on 1/18/21.
//

import Foundation
import EssentialFeed2

final class FeedViewModel {
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var onChange: ((FeedViewModel) -> Void)?
    var onFeedLoad: (([FeedImage]) -> Void)?
    
    private(set) var isLoading:Bool = false {
        didSet { onChange?(self) }
    }

    
    func loadFeed() {
        isLoading = true
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.isLoading = false 
        }
    }
}
