//
//  ViperitModule.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import UIKit

// MARK: - Module View Types
public enum ViperitViewType {
    case storyboard
    case nib
    case code
}

// MARK: - Viperit Module Protocol
public protocol ViperitModule {
    
    var viewType: ViperitViewType { get }
    var viewName: String { get }
    func build(bundle: Bundle, deviceType: UIUserInterfaceIdiom?) -> Module
    
    // MARK: - Custom Init
    func loadView(bundle: Bundle, viewClass: UIViewController.Type) -> UserInterface
    func build(view: UserInterface, interactor: Interactor?, presenter: Presenter, router: Router, displayData: DisplayData?) -> Module
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
    
    func loadView(bundle: Bundle = Bundle.main, viewClass: UIViewController.Type) -> UserInterface {
        return Module.loadView(forModule: self, bundle: bundle, viewClass: viewClass)
    }
    
    func build(view: UserInterface, interactor: Interactor?, presenter: Presenter, router: Router, displayData: DisplayData?) -> Module {
        return Module.build(view: view, interactor: interactor, presenter: presenter, router: router, displayData: displayData)
    }
}
