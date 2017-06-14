//
//  ViperitModule.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

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
}

public extension ViperitModule where Self: RawRepresentable, Self.RawValue == String {
    var viewType: ViperitViewType {
        return .storyboard
    }
    
    var viewName: String {
        return rawValue
    }
}
