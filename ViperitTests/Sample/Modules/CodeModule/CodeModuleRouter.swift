//
//  CodeModuleRouter.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//Copyright © 2017 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - CodeModuleRouter class
final class CodeModuleRouter: Router {
}

// MARK: - CodeModuleRouter API
extension CodeModuleRouter: CodeModuleRouterApi {
}

// MARK: - CodeModule Viper Components
private extension CodeModuleRouter {
    var presenter: CodeModulePresenterApi {
        return _presenter as! CodeModulePresenterApi
    }
}
