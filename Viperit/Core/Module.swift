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
    public private(set) var view: UserInterface
    public private(set) var interactor: Interactor
    public private(set) var presenter: Presenter
    public private(set) var router: Router
    public private(set) var displayData: DisplayData
    
    static func build<T: RawRepresentable & ViperitModule>(_ module: T, bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil) -> Module where T.RawValue == String {
        //Get class types
        let interactorClass = module.classForViperComponent(.interactor, bundle: bundle) as! Interactor.Type
        let presenterClass = module.classForViperComponent(.presenter, bundle: bundle) as! Presenter.Type
        let routerClass = module.classForViperComponent(.router, bundle: bundle) as! Router.Type
        let displayDataClass = module.classForViperComponent(.displayData, bundle: bundle) as! DisplayData.Type

        //Allocate VIPER components
        let V = loadView(forModule: module, bundle: bundle, deviceType: deviceType)
        let I = interactorClass.init()
        let P = presenterClass.init()
        let R = routerClass.init()
        let D = displayDataClass.init()
        
        return build(view: V, interactor: I, presenter: P, router: R, displayData: D)
    }
}

//MARK: - Inject Mock Components for Testing
public extension Module {

    public mutating func injectMock(view mockView: UserInterface) {
        view = mockView
        view._presenter = presenter
        view._displayData = displayData
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
        view._presenter = presenter
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
    
    static func loadView<T: RawRepresentable & ViperitModule>(forModule module: T, bundle: Bundle, deviceType: UIUserInterfaceIdiom? = nil) -> UserInterface where T.RawValue == String {
        let viewClass = module.classForViperComponent(.view, bundle: bundle, deviceType: deviceType) as! UIViewController.Type
        let viewIdentifier = safeString(NSStringFromClass(viewClass).components(separatedBy: ".").last)
        let viewName = module.viewName.uppercasedFirst
        
        switch module.viewType {
        case .storyboard:
            let sb = UIStoryboard(name: viewName, bundle: bundle)
            return sb.instantiateViewController(withIdentifier: viewIdentifier) as! UserInterface
        case .nib:
            return viewClass.init(nibName: viewName, bundle: bundle) as! UserInterface
        case .code:
            return viewClass.init() as! UserInterface
        }
    }
    
    static func build(view: UserInterface, interactor: Interactor, presenter: Presenter, router: Router, displayData: DisplayData) -> Module {
        //View connections
        view._presenter = presenter
        view._displayData = displayData
        
        //Interactor connections
        interactor._presenter = presenter
        
        //Presenter connections
        presenter._router = router
        presenter._interactor = interactor
        presenter._view = view
        
        //Router connections
        router._presenter = presenter
        
        return Module(view: view, interactor: interactor, presenter: presenter, router: router, displayData: displayData)
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
