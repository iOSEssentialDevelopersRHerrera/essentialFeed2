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
        get { return label.text }
        set { label.text = newValue}
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = nil 
    }
}
