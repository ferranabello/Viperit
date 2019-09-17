//
//  SwiftUIRouter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SwiftUIRouter class
final class SwiftUIRouter: Router {
}

// MARK: - SwiftUIRouter API
extension SwiftUIRouter: SwiftUIRouterApi {
}

// MARK: - SwiftUI Viper Components
private extension SwiftUIRouter {
    var presenter: SwiftUIPresenterApi {
        return _presenter as! SwiftUIPresenterApi
    }
}
