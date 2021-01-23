//
//  UIImageView+Animations.swift
//  Essentialfeed2iOS
//
//  Created by Ricardo Herrera Petit on 1/22/21.
//

import UIKit

extension UIImageView {
    func setImageAnimated(_ newImage: UIImage?) {
        image = newImage
        
        guard newImage != nil else { return }
        
        alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
}
