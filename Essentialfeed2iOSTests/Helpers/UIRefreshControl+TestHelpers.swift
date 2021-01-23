//
//  UIRefreshControl+TestHelpers.swift
//  Essentialfeed2iOSTests
//
//  Created by Ricardo Herrera Petit on 1/23/21.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        allTargets.forEach{ target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }

    }

}
