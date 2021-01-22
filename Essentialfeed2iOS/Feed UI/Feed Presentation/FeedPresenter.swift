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
    private let feedview: FeedView
    private let loadingView: FeedLoadingView
    
    init(feedView: FeedView, loadingView: FeedLoadingView) {
        self.feedview = feedView
        self.loadingView = loadingView
    }
    
    func didStartLoadingFeed() {
        loadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedview.display(FeedViewModel(feed: feed))
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoadingFeed(with error: Error) {
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
 
}
