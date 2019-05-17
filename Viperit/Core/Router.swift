//
//  Router.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit

public protocol RouterProtocol: ViperitComponent {
    var _presenter: PresenterProtocol! { get set }
    var _view: UserInterfaceProtocol! { get }
    
    func embedInNavigationController() -> UINavigationController
    func show(inWindow window: UIWindow?, embedInNavController: Bool, setupData: Any?, makeKeyAndVisible: Bool)
    func show(from: UIViewController, embedInNavController: Bool, setupData: Any?)
    func show(from containerView: UIViewController, insideView targetView: UIView, setupData: Any?)
    func present(from: UIViewController, embedInNavController: Bool, presentationStyle: UIModalPresentationStyle, transitionStyle: UIModalTransitionStyle, setupData: Any?, completion: (() -> Void)?)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
}

public extension RouterProtocol {
    var viewController: UIViewController {
        return _view as! UIViewController
    }
}

open class Router: RouterProtocol {
    public weak var _presenter: PresenterProtocol!
    public var _view: UserInterfaceProtocol! {
        return _presenter._view
    }
    
    open func embedInNavigationController() -> UINavigationController {
        return getNavigationController() ?? UINavigationController(rootViewController: viewController)
    }
    
    open func show(inWindow window: UIWindow?, embedInNavController: Bool = false, setupData: Any? = nil, makeKeyAndVisible: Bool = true) {
        process(setupData: setupData)
        let view = embedInNavController ? embedInNavigationController() : viewController
        window?.rootViewController = view
        if makeKeyAndVisible {
            window?.makeKeyAndVisible()
        }
    }
    
    open func show(from: UIViewController, embedInNavController: Bool = false, setupData: Any? = nil) {
        process(setupData: setupData)
        let view: UIViewController = embedInNavController ? embedInNavigationController() : viewController
        from.show(view, sender: nil)
    }
    
    public func show(from containerView: UIViewController, insideView targetView: UIView, setupData: Any? = nil) {
        process(setupData: setupData)
        addAsChildView(ofView: containerView, insideContainer: targetView)
    }
    
    public func present(from: UIViewController, embedInNavController: Bool = false, presentationStyle: UIModalPresentationStyle = .fullScreen, transitionStyle: UIModalTransitionStyle = .coverVertical, setupData: Any? = nil, completion: (() -> Void)? = nil) {
        let view: UIViewController = embedInNavController ? embedInNavigationController() : viewController
        view.modalTransitionStyle = transitionStyle
        view.modalPresentationStyle = presentationStyle
        
        process(setupData: setupData)
        from.present(view, animated: true, completion: completion)
    }
    
    public func dismiss(animated flag: Bool = true, completion: (() -> Void)? = nil) {
        viewController.dismiss(animated: flag, completion: completion)
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

//MARK: - Get navigation controller helper
public extension RouterProtocol {
    func getNavigationController() -> UINavigationController? {
        guard let view = _view as? UIViewController else { return nil }
        if let nav = view.navigationController {
            return nav
        } else if let parent = view.parent {
            if let parentNav = parent.navigationController {
                return parentNav
            }
        }
        return nil
    }
}

//MARK: - Embed view in a container view
public extension RouterProtocol {
    func addAsChildView(ofView parentView: UIViewController, insideContainer containerView: UIView) {
        guard let view = _view as? UIViewController else { return }
        parentView.addChild(view)
        containerView.addSubview(view.view)
        stretchToBounds(containerView, view: view.view)
        view.didMove(toParent: parentView)
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
