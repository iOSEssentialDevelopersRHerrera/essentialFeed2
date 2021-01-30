//
//  UIRefreshControl+Helpers.swift
//  Essentialfeed2iOS
//
//  Created by Ricardo Herrera Petit on 1/29/21.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing() 
    }
}
