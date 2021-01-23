//
//  UIButton+TestHelpers.swift
//  Essentialfeed2iOSTests
//
//  Created by Ricardo Herrera Petit on 1/23/21.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
