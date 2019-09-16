//
//  TableOfContentsRouter.swift
//  Viperit
//
//  Created by Ferran on 01/04/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - TableOfContentsRouter class
final class TableOfContentsRouter: Router {
}

// MARK: - TableOfContentsRouter API
extension TableOfContentsRouter: TableOfContentsRouterApi {
    func goHome() {
        let home = AppModules.home.build()
        home.router.show(from: viewController, embedInNavController: false, setupData: nil)
    }
    
    func goToCool() {
        let module = AppModules.cool.build { presenter -> (CoolView, UserSettings) in
            let p = presenter as! CoolPresenterApi
            let settings = p.settings()
            return (CoolView(presenter: p), settings)
        }

        let router = module.router as! CoolRouter
        router.show(from: viewController)
    }
    
    func goToSimple() {
        let simple = AppModules.simple.build()
        simple.router.show(from: viewController, embedInNavController: true, setupData: nil)
    }
}

// MARK: - TableOfContents Viper Components
private extension TableOfContentsRouter {
    var presenter: TableOfContentsPresenterApi {
        return _presenter as! TableOfContentsPresenterApi
    }
}
