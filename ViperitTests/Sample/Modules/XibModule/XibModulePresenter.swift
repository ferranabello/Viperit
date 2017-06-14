//
//  XibModulePresenter.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//Copyright © 2017 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - XibModulePresenter Class
final class XibModulePresenter: Presenter {
}

// MARK: - XibModulePresenter API
extension XibModulePresenter: XibModulePresenterApi {
}

// MARK: - XibModule Viper Components
private extension XibModulePresenter {
    var view: XibModuleViewApi {
        return _view as! XibModuleViewApi
    }
    var interactor: XibModuleInteractorApi {
        return _interactor as! XibModuleInteractorApi
    }
    var router: XibModuleRouterApi {
        return _router as! XibModuleRouterApi
    }
}
