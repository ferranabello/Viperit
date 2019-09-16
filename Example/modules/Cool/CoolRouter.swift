//
//  CoolRouter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - CoolRouter class
final class CoolRouter: Router {
}

// MARK: - CoolRouter API
extension CoolRouter: CoolRouterApi {
}

// MARK: - Cool Viper Components
private extension CoolRouter {
    var presenter: CoolPresenterApi {
        return _presenter as! CoolPresenterApi
    }
}
