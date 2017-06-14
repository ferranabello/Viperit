//
//  XibModuleRouter.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//Copyright © 2017 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - XibModuleRouter class
final class XibModuleRouter: Router {
}

// MARK: - XibModuleRouter API
extension XibModuleRouter: XibModuleRouterApi {
}

// MARK: - XibModule Viper Components
private extension XibModuleRouter {
    var presenter: XibModulePresenterApi {
        return _presenter as! XibModulePresenterApi
    }
}
