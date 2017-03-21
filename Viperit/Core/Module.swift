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

//MARK: - Viperit Module Protocol
public protocol ViperitModule {
    var storyboardName: String { get }
}

public extension RawRepresentable where Self: ViperitModule, RawValue == String {
    var storyboardName: String {
        return rawValue
    }
}

//MARK: - Module
public struct Module {
    public fileprivate(set) var view: UserInterface!
    public fileprivate(set) var interactor: Interactor!
    public fileprivate(set) var presenter: Presenter!
    public fileprivate(set) var router: Router!
    public fileprivate(set) var displayData: DisplayData!
    
    public static func build<T: RawRepresentable & ViperitModule>(_ module: T, bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil) -> Module where T.RawValue == String {
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
fileprivate extension Module {
    
    fileprivate static func loadView<T: RawRepresentable & ViperitModule>(forModule module: T, bundle: Bundle, deviceType: UIUserInterfaceIdiom? = nil) -> UserInterface where T.RawValue == String {
        let viewClass = module.classForViperComponent(.view, bundle: bundle, deviceType: deviceType) as! UIViewController.Type
        let sb = UIStoryboard(name: module.storyboardName.uppercasedFirst, bundle: bundle)
        let viewIdentifier = NSStringFromClass(viewClass).components(separatedBy: ".").last! as String
        let viewObject = sb.instantiateViewController(withIdentifier: viewIdentifier) as! UserInterface
        return viewObject
    }
    
    fileprivate static func build(view: UserInterface, interactor: Interactor, presenter: Presenter, router: Router, displayData: DisplayData) -> Module {
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
fileprivate extension RawRepresentable where RawValue == String {

    fileprivate func classForViperComponent(_ component: ViperComponent, bundle: Bundle, deviceType: UIUserInterfaceIdiom? = nil) -> Swift.AnyClass? {
        let className = rawValue.uppercasedFirst + component.rawValue.uppercasedFirst
        let bundleName = bundle.infoDictionary!["CFBundleName"] as! String
        let classInBundle = (bundleName + "." + className).replacingOccurrences(of: " ", with: "_")
        
        if component == .view {
            let deviceType = deviceType ?? UIScreen.main.traitCollection.userInterfaceIdiom
            let isPad = deviceType == .pad
            if isPad {
                if let tabletView = NSClassFromString(classInBundle + kTabletSuffix) {
                    return tabletView
                }
            }
        }
        
        return NSClassFromString(classInBundle)
    }
}
