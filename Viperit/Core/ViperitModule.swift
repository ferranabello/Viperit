//
//  ViperitModule.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import UIKit

//MARK: - Module View Types
public enum ViperitViewType {
    case storyboard
    case nib
    case code
}

//MARK: - Viperit Module Protocol
public protocol ViperitModule {
    var viewType: ViperitViewType { get }
    var viewName: String { get }
    func build(bundle: Bundle, deviceType: UIUserInterfaceIdiom?, sbModule: AppModules?) -> Module
}

public extension ViperitModule where Self: RawRepresentable, Self.RawValue == String {
    var viewType: ViperitViewType {
        if let _ = Bundle.main.path(forResource: viewName.uppercasedFirst, ofType: "storyboardc") {
            return .storyboard
        }
        if Bundle.main.path(forResource: viewName.uppercasedFirst, ofType: "nib") != nil  {
            return .nib
        }
        return .code
    }
    
    var viewName: String {
        return rawValue
    }
    
    func build(bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil, sbModule: AppModules? = nil) -> Module {
        return Module.build(self, bundle: bundle, deviceType: deviceType, storyboardModule: sbModule)
    }
}
