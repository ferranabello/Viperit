//
//  SimplePresenter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SimplePresenter Class
final class SimplePresenter: Presenter {
}

// MARK: - SimplePresenter API
extension SimplePresenter: SimplePresenterApi {
}

// MARK: - Simple Viper Components
private extension SimplePresenter {
    var view: SimpleViewApi {
        return _view as! SimpleViewApi
    }
    var interactor: SimpleInteractorApi {
        return _interactor as! SimpleInteractorApi
    }
    var router: SimpleRouterApi {
        return _router as! SimpleRouterApi
    }
}
