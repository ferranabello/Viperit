//
//  Router.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit

public protocol RouterProtocol {
    weak var _presenter: Presenter! { get set }
    var _view: UserInterface! { get }
    
    func show(inWindow window: UIWindow?, embedInNavController: Bool)
    func show(from: UIViewController, embedInNavController: Bool)
    func show(from: UIViewController, setupData: Any, embedInNavController: Bool)
}

open class Router: RouterProtocol {
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
        let view = embedInNavController ? embedInNavigationController() : _view
        _presenter.setupView(data: setupData)
        from.show(view, sender: nil)
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
