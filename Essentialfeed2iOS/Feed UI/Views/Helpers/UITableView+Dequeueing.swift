//
//  UITableView+Dequeueing.swift
//  Essentialfeed2iOS
//
//  Created by Ricardo Herrera Petit on 1/22/21.
//

import UIKit

extension UITableView  {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
