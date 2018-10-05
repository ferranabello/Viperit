//
//  HomeRouter.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit
import Viperit

final class HomeRouter: Router {
    func showSecondModule() {
        let module = AppModules.second.build()
        module.router.show(from: _view) {
            // view loaded
        }
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HomeRouter {
    var presenter: HomePresenter {
        return _presenter as! HomePresenter
    }
}
