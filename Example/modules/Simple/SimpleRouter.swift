//
//  SimpleRouter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SimpleRouter class
final class SimpleRouter: Router {
}

// MARK: - SimpleRouter API
extension SimpleRouter: SimpleRouterApi {
}

// MARK: - Simple Viper Components
private extension SimpleRouter {
    var presenter: SimplePresenterApi {
        return _presenter as! SimplePresenterApi
    }
}
