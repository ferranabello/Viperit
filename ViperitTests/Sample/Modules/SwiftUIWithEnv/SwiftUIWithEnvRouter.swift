//
//  SwiftUIWithEnvRouter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SwiftUIWithEnvRouter class
final class SwiftUIWithEnvRouter: Router {
}

// MARK: - SwiftUIWithEnvRouter API
extension SwiftUIWithEnvRouter: SwiftUIWithEnvRouterApi {
}

// MARK: - SwiftUIWithEnv Viper Components
private extension SwiftUIWithEnvRouter {
    var presenter: SwiftUIWithEnvPresenterApi {
        return _presenter as! SwiftUIWithEnvPresenterApi
    }
}
