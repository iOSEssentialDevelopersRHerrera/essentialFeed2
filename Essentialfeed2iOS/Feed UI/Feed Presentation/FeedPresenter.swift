//
//  FeedViewModel.swift
//  Essentialfeed2iOS
//
//  Created by Ricardo Herrera Petit on 1/18/21.
//

import Foundation
import EssentialFeed2


struct FeedLoadingViewModel {
    let isLoading: Bool
}

protocol FeedLoadingView: class {
    func display(_ viewModel: FeedLoadingViewModel)
}


struct FeedViewModel {
    let feed: [FeedImage]
}

protocol FeedView  {
    func display(_ viewModel:FeedViewModel)
}



final class FeedPresenter {
    typealias Observer<T> = (T) -> Void
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var feedview: FeedView?
    var loadingView: FeedLoadingView?
    
    func loadFeed() {
        loadingView?.display(FeedLoadingViewModel(isLoading: true))
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.feedview?.display(FeedViewModel(feed: feed))
            }
            self?.loadingView?.display(FeedLoadingViewModel(isLoading: false))
        }
    }
}
