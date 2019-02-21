//
//  Module.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import Foundation
import UIKit

private let kTabletSuffix = "Pad"

//MARK: - Module
public struct Module {
    public private(set) var view: Any
    public private(set) var interactor: Interactor
    public private(set) var presenter: Presenter
    public private(set) var router: Router
    
    static func build<T: RawRepresentable & ViperitModule>(_ module: T, bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil, storyboardModule: AppModules? = nil) -> Module where T.RawValue == String {
        //Get class types
        let interactorClass = module.classForViperComponent(.interactor, bundle: bundle) as! Interactor.Type
        let presenterClass = module.classForViperComponent(.presenter, bundle: bundle) as! Presenter.Type
        let routerClass = module.classForViperComponent(.router, bundle: bundle) as! Router.Type

        //Allocate VIPER components
        let V = loadView(forModule: module, bundle: bundle, deviceType: deviceType, storyboardModule: storyboardModule)
        let I = interactorClass.init()
        let P = presenterClass.init()
        let R = routerClass.init()
        
        return build(view: V, interactor: I, presenter: P, router: R)
    }
}

//MARK: - Inject Mock Components for Testing
public extension Module {

    public mutating func injectMock(view mockView: UserInterface) {
        view = mockView
        if view is UserInterface { (view as! UserInterface)._presenter = presenter }
        if view is TableUserInterface { (view as! TableUserInterface)._presenter = presenter }
        if view is TabUserInterface { (view as! TabUserInterface)._presenter = presenter }
        presenter._view = view
    }
    
    public mutating func injectMock(interactor mockInteractor: Interactor) {
        interactor = mockInteractor
        interactor._presenter = presenter
        presenter._interactor = interactor
    }
    
    public mutating func injectMock(presenter mockPresenter: Presenter) {
        presenter = mockPresenter
        presenter._view = view
        presenter._interactor = interactor
        presenter._router = router
        
        if view is UserInterface { (view as! UserInterface)._presenter = presenter }
        if view is TableUserInterface { (view as! TableUserInterface)._presenter = presenter }
        if view is TabUserInterface { (view as! TabUserInterface)._presenter = presenter }
        
        interactor._presenter = presenter
        router._presenter = presenter
    }
    
    public mutating func injectMock(router mockRouter: Router) {
        router = mockRouter
        router._presenter = presenter
        presenter._router = router
    }
}


//MARK: - Helper Methods
private extension Module {
    
    static func loadView<T: RawRepresentable & ViperitModule>(forModule module: T, bundle: Bundle, deviceType: UIUserInterfaceIdiom? = nil, storyboardModule: AppModules? = nil) -> Any where T.RawValue == String {
        let viewClass = module.classForViperComponent(.view, bundle: bundle, deviceType: deviceType) as! UIViewController.Type
        let viewIdentifier = safeString(NSStringFromClass(viewClass).components(separatedBy: ".").last)
        let viewName = module.viewName.uppercasedFirst
        let sbName = storyboardModule?.viewName.uppercasedFirst ?? viewName
        
        func instanceFromSb() -> UIViewController {
            let sb = UIStoryboard(name: sbName, bundle: bundle)
            return sb.instantiateViewController(withIdentifier: viewIdentifier)
        }
        if storyboardModule != nil { return instanceFromSb() }
        
        switch module.viewType {
        case .storyboard:
            return instanceFromSb()
        case .nib:
            return viewClass.init(nibName: viewName, bundle: bundle)
        case .code:
            return viewClass.init()
        }
    }
    
    static func build(view: Any, interactor: Interactor, presenter: Presenter, router: Router) -> Module {
        //View connections
        if view is UserInterface { (view as! UserInterface)._presenter = presenter }
        if view is TableUserInterface { (view as! TableUserInterface)._presenter = presenter }
        if view is TabUserInterface { (view as! TabUserInterface)._presenter = presenter }
        
        //Interactor connections
        interactor._presenter = presenter
        
        //Presenter connections
        presenter._router = router
        presenter._interactor = interactor
        if view is UserInterface { presenter._view = view as! UserInterface }
        if view is TableUserInterface { presenter._view = view as! TableUserInterface }
        if view is TabUserInterface { presenter._view = view as! TabUserInterface }
        
        //Router connections
        router._presenter = presenter
        
        return Module(view: view, interactor: interactor, presenter: presenter, router: router)
    }
}


//MARK: - Private Extension for Application Module generic enum
private extension RawRepresentable where RawValue == String {

    func classForViperComponent(_ component: ViperComponent, bundle: Bundle, deviceType: UIUserInterfaceIdiom? = nil) -> Swift.AnyClass? {
        let className = rawValue.uppercasedFirst + component.rawValue.uppercasedFirst
        let bundleName = safeString(bundle.infoDictionary?["CFBundleName"])
        let classInBundle = (bundleName + "." + className).replacingOccurrences(of: " ", with: "_")
        
        if component == .view {
            let deviceType = deviceType ?? UIScreen.main.traitCollection.userInterfaceIdiom
            let isPad = deviceType == .pad
            if isPad, let tabletView = NSClassFromString(classInBundle + kTabletSuffix) {
                return tabletView
            }
        }
        
        return NSClassFromString(classInBundle)
    }
}
