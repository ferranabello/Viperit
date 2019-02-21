//
//  Router.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit

public protocol RouterProtocol {
    var _presenter: Presenter! { get set }
    var _view: UIViewController! { get }
    
    func show(inWindow window: UIWindow?, embedInNavController: Bool, setupData: Any?, makeKeyAndVisible: Bool)
    func show(from: Router, embedInNavController: Bool, setupData: Any?, parentRouter: Router?)
    func show(from containerView: UIViewController, insideView targetView: UIView, setupData: Any?)
    func present(from: UIViewController, embedInNavController: Bool, presentationStyle: UIModalPresentationStyle, transitionStyle: UIModalTransitionStyle, setupData: Any?, completion: (() -> Void)?)
    func needsUpdate()
    func dismiss(parentNeedsUpdate: Bool)
    func pop(parentNeedsUpdate: Bool)
}

open class Router: RouterProtocol {
    public weak var _parentRouter: Router?
    public weak var _presenter: Presenter!
    public var _view: UIViewController! {
        return _presenter._view as? UIViewController
    }
    var _routers = [AppModules: Router]()
    
    open func show(inWindow window: UIWindow?, embedInNavController: Bool = false, setupData: Any? = nil, makeKeyAndVisible: Bool = true) {
        process(setupData: setupData)
        let view = embedInNavController ? embedInNavigationController() : _view
        window?.rootViewController = view
        if makeKeyAndVisible {
            window?.makeKeyAndVisible()
        }
    }
    
    open func push(from: Router, setupData: Any? = nil, parentRouter: Router? = nil) {
        _parentRouter = parentRouter ?? from
        process(setupData: setupData)
        from._view.navigationController?.pushViewController(_view, animated: true)
    }
    
    open func show(from: Router, embedInNavController: Bool = false, setupData: Any? = nil, parentRouter: Router? = nil) {
        _parentRouter = parentRouter ?? from
        process(setupData: setupData)
        let view = embedInNavController ? embedInNavigationController() : _view
        from._view.show(view!, sender: nil)
    }
    
    public func show(from containerView: UIViewController, insideView targetView: UIView, setupData: Any? = nil) {
        process(setupData: setupData)
        addAsChildView(ofView: containerView, insideContainer: targetView)
    }
    
    public func present(from: UIViewController, embedInNavController: Bool = false, presentationStyle: UIModalPresentationStyle = .fullScreen, transitionStyle: UIModalTransitionStyle = .coverVertical, setupData: Any? = nil, completion: (() -> Void)? = nil) {
        let view: UIViewController = embedInNavController ? embedInNavigationController() : _view
        view.modalTransitionStyle = transitionStyle
        view.modalPresentationStyle = presentationStyle
        
        process(setupData: setupData)
        from.present(view, animated: true, completion: completion)
    }
    
    public func addTabs(modules: [AppModules]) {
        modules.forEach { (module) in
            addModuleTab(module: module)
        }
    }
    
    public func addModuleTab(module: AppModules) {
        let router = module.build().router
        router._parentRouter = self
        _routers[module] = router
        
        if let tabBar = _view as? UITabBarController {
            var tabs = tabBar.viewControllers ?? []
            let title = module.viewName.localized().capitalized
            let image = UIImage(named: title.capitalized)
            let tabItem = UITabBarItem(title: title, image: image, tag: tabs.count)
            
            if let vc = router._view {
                vc.title = title
                vc.tabBarItem = tabItem
                tabs.append(vc.embedInNavigationController())
                tabBar.setViewControllers(tabs, animated: false)
            }
        }
    }
    
    public func needsUpdate() {
        // TODO: Update
    }
    
    required public init() { }
}

//MARK: - Process possible setup data
private extension Router {
    func process(setupData: Any?) {
        if let data = setupData {
            _presenter.setupView(data: data)
        }
    }
}

//MARK: - Embed view in navigation controller
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

//MARK: - Dismiss Current View
public extension Router {
    func pop(parentNeedsUpdate: Bool = false) {
        if let navController = _view.navigationController {
            navController.popViewController(animated: true) {
                if parentNeedsUpdate {
                    self._parentRouter?.needsUpdate()
                }
            }
        }
    }
    func dismiss(parentNeedsUpdate: Bool = false) {
        func notify() {
            if parentNeedsUpdate {
                self._parentRouter?.needsUpdate()
            }
        }
        guard let navController = _view.navigationController else {
            _view.dismiss(animated: true) { notify() }
            return
        }
        navController.dismiss(animated: true) { notify() }
    }
}

//MARK: - Embed view in a container view
public extension Router {
    func addAsChildView(ofView parentView: UIViewController, insideContainer containerView: UIView) {
        parentView.addChild(_view)
        containerView.addSubview(_view.view)
        stretchToBounds(containerView, view: _view.view)
        _view.didMove(toParent: parentView)
    }
    
    private func stretchToBounds(_ holderView: UIView, view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let pinDirections: [NSLayoutConstraint.Attribute] = [.top, .bottom, .left, .right]
        let pinConstraints = pinDirections.map { direction -> NSLayoutConstraint in
            return NSLayoutConstraint(item: view, attribute: direction, relatedBy: .equal,
                                      toItem: holderView, attribute: direction, multiplier: 1.0, constant: 0)
        }
        holderView.addConstraints(pinConstraints)
    }
}
