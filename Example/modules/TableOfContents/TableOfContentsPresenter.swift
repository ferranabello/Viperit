//
//  TableOfContentsPresenter.swift
//  Viperit
//
//  Created by Ferran on 01/04/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - TableOfContentsPresenter Class
final class TableOfContentsPresenter: Presenter {
}

// MARK: - TableOfContentsPresenter API
extension TableOfContentsPresenter: TableOfContentsPresenterApi {
    func showHome() {
        router.goHome()
    }
}

// MARK: - TableOfContents Viper Components
private extension TableOfContentsPresenter {
    var view: TableOfContentsViewApi {
        return _view as! TableOfContentsViewApi
    }
    var interactor: TableOfContentsInteractorApi {
        return _interactor as! TableOfContentsInteractorApi
    }
    var router: TableOfContentsRouterApi {
        return _router as! TableOfContentsRouterApi
    }
}
