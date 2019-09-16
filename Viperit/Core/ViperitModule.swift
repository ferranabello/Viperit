//
//  ViperitModule.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import UIKit

#if canImport(SwiftUI)
import SwiftUI
#endif


//MARK: - Module View Types
public enum ViperitViewType {
    case swiftUI
    case storyboard
    case nib
    case code
}

//MARK: - Viperit Module Protocol
public protocol ViperitModule {
    var viewType: ViperitViewType { get }
    var viewName: String { get }
    func build(bundle: Bundle, deviceType: UIUserInterfaceIdiom?) -> Module
    
    @available(iOS 13.0, *)
    func build<T: View, E: ObservableObject>(bundle: Bundle, deviceType: UIUserInterfaceIdiom?, setupUI: ((PresenterProtocol) -> (T, E))?) -> Module
    
    @available(iOS 13.0, *)
    func build<T: View>(bundle: Bundle, deviceType: UIUserInterfaceIdiom?, setupUI: ((PresenterProtocol) -> T)?) -> Module
}

public extension ViperitModule where Self: RawRepresentable, Self.RawValue == String {
    var viewType: ViperitViewType {
        return .storyboard
    }
    
    var viewName: String {
        return rawValue
    }
    
    func build(bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil) -> Module {
        return Module.build(self, bundle: bundle, deviceType: deviceType)
    }
    
    @available(iOS 13.0, *)
    func build<T: View, E: ObservableObject>(bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil, setupUI: ((PresenterProtocol) -> (T, E))? = nil) -> Module {
        guard let setup = setupUI else {
            return Module.build(self, bundle: bundle, deviceType: deviceType)
        }
        
        //Get class types
        let interactorClass = classForViperComponent(.interactor, bundle: bundle) as! InteractorProtocol.Type
        let presenterClass = classForViperComponent(.presenter, bundle: bundle) as! PresenterProtocol.Type
        let routerClass = classForViperComponent(.router, bundle: bundle) as! RouterProtocol.Type
        let displayDataClass = classForViperComponent(.displayData, bundle: bundle) as? DisplayData.Type
        
        //Allocate VIPER components
        let interactor = interactorClass.init()
        let presenter = presenterClass.init()
        let router = routerClass.init()
        let displayData = displayDataClass?.init()
        
        let set = setup(presenter)
        let viewUI = set.0
        
        let viewHost: UserInterfaceProtocol
        let envObject = set.1
        viewHost = HostingUserInterface(rootView: viewUI.environmentObject(envObject))

        return Module.build(view: viewHost, interactor: interactor, presenter: presenter, router: router, displayData: displayData)
    }
    
    
    @available(iOS 13.0, *)
    func build<T: View>(bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil, setupUI: ((PresenterProtocol) -> T)? = nil) -> Module {
        guard let setup = setupUI else {
            return Module.build(self, bundle: bundle, deviceType: deviceType)
        }
        
        //Get class types
        let interactorClass = classForViperComponent(.interactor, bundle: bundle) as! InteractorProtocol.Type
        let presenterClass = classForViperComponent(.presenter, bundle: bundle) as! PresenterProtocol.Type
        let routerClass = classForViperComponent(.router, bundle: bundle) as! RouterProtocol.Type
        let displayDataClass = classForViperComponent(.displayData, bundle: bundle) as? DisplayData.Type
        
        //Allocate VIPER components
        let interactor = interactorClass.init()
        let presenter = presenterClass.init()
        let router = routerClass.init()
        let displayData = displayDataClass?.init()
        
        let viewUI = setup(presenter)
        let viewHost: UserInterfaceProtocol
        viewHost = HostingUserInterface(rootView: viewUI)
        
        return Module.build(view: viewHost, interactor: interactor, presenter: presenter, router: router, displayData: displayData)
    }
}
