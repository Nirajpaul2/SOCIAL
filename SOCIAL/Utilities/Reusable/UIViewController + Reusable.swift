//
//  UIViewController + Reusable.swift
//
//  Copyright © 2018. All rights reserved.
//

import UIKit

extension UIViewController: Reusable {
    
    class func loadFromNib<viewController: UIViewController>() -> viewController{
        return viewController(nibName: String(describing: self), bundle: nil)
    }
    
}
