//
//  FeedRefreshViewController.swift
//  Essentialfeed2iOS
//
//  Created by Ricardo Herrera Petit on 1/17/21.
//

import UIKit

final class FeedRefreshViewController: NSObject {
    private(set) lazy var view: UIRefreshControl = binded(UIRefreshControl())
    
    private let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    
    
    @objc func refresh() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view:UIRefreshControl) -> UIRefreshControl {
        viewModel.onLoadingStateChange = { [weak view] isLoading in
                if isLoading {
                    view?.beginRefreshing()
                } else {
                    view?.endRefreshing()
                }
            }
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return view
    }
}
