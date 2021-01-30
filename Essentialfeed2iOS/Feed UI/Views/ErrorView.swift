//
//  ErrorView.swift
//  Essentialfeed2iOS
//
//  Created by Ricardo Herrera Petit on 1/29/21.
//

import UIKit

public final class ErrorView:UIView {
    @IBOutlet private var label: UILabel!
    
    public var message: String? {
        get { return isVisible ? label.text : nil }
        set { setMessageAnimated(newValue) }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = nil
        alpha = 0
    }
    
    private var isVisible: Bool {
        return alpha > 0
    }
    
    private func setMessageAnimated(_ message: String?) {
        if let message = message {
            showAnimated(message)
        } else {
            hideMessage()
        }
    }
    
    private func showAnimated(_ message: String) {
        label.text = message
        
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
    
    private func hideMessage() {
        UIView.animate(withDuration: 0.25,
                       animations: { self.alpha = 0},
                       completion: { completed in
                        if completed { self.label.text = nil }
        })
    }
}
