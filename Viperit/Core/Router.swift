//
//  Router.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit

open class Router {
    public var _presenter: Presenter!
    public var _view: UserInterface! {
        return _presenter._view
    }
    
    open func show(inWindow window: UIWindow?) {
        window?.rootViewController = _view
        window?.makeKeyAndVisible()
    }
    
    open func show(from: UIViewController) {
        from.show(_view, sender: nil)
    }
    
    open func show(from: UIViewController, setupData: Any) {
        print(ViperitError.methodNotImplemented.description)
    }
    
    required public init() { }
}
