//
//  Router.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit

open class Router {
    public weak var _presenter: Presenter!
    public var _view: UserInterface! {
        return _presenter._view
    }
    
    open func show(inWindow window: UIWindow?, embedInNavController: Bool = false) {
        let view = embedInNavController ? embedInNavigationController() : _view
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
    
    open func show(from: UIViewController, embedInNavController: Bool = false) {
        let view = embedInNavController ? embedInNavigationController() : _view
        from.show(view, sender: nil)
    }
    
    open func show(from: UIViewController, setupData: Any, embedInNavController: Bool = false) {
        print(ViperitError.methodNotImplemented.description)
    }
    
    required public init() { }
}

public extension Router {
    private func getNavigationController() -> UINavigationController? {
        if let nav = _view.navigationController {
            return nav
        } else if let parent = _view.parent {
            if let parentNav = parent.navigationController {
                return parentNav
            }
        }
        return nil
    }
    
    func embedInNavigationController() -> UINavigationController {
        return getNavigationController() ?? UINavigationController(rootViewController: _view)
    }
}
