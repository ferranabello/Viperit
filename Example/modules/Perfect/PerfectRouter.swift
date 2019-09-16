//
//  PerfectRouter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - PerfectRouter class
final class PerfectRouter: Router {
}

// MARK: - PerfectRouter API
extension PerfectRouter: PerfectRouterApi {
}

// MARK: - Perfect Viper Components
private extension PerfectRouter {
    var presenter: PerfectPresenterApi {
        return _presenter as! PerfectPresenterApi
    }
}
