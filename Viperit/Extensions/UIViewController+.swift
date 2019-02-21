//
//  UIViewController+.swift
//  Viperit
//
//  Created by Daniel Griso Filho on 21/02/19.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func embedInNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
