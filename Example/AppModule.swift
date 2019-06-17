//
//  AppModule.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

//MARK: - Application modules
enum AppModules: String, ViperitModule {
    case home
    case second
    case tableOfContents
    case cool
    
    var viewType: ViperitViewType {
        switch self {
        case .cool: return .swiftUI
        case .tableOfContents: return .code
        default: return .storyboard
        }
    }
}
