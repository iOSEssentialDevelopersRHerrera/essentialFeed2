//
//  UIControl+TestHelpers.swift
//  Essentialfeed2iOSTests
//
//  Created by Ricardo Herrera Petit on 1/23/21.
//

import Foundation

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
