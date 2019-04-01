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
}

// MARK: - TableOfContents Viper Components
private extension TableOfContentsRouter {
    var presenter: TableOfContentsPresenterApi {
        return _presenter as! TableOfContentsPresenterApi
    }
}
