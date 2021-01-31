//
//  UIRefreshControl+TestHelpers.swift
//  Essentialfeed2iOSTests
//
//  Created by Ricardo Herrera Petit on 1/23/21.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
