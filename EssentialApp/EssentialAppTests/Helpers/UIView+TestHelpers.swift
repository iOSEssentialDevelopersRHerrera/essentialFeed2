//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Ricardo Herrera Petit on 3/17/21.
//

import UIKit

extension UIView {
     func enforceLayoutCycle() {
         layoutIfNeeded()
         RunLoop.current.run(until: Date())
     }
 }
