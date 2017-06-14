//
//  CodeModulePresenter.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//Copyright © 2017 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - CodeModulePresenter Class
final class CodeModulePresenter: Presenter {
}

// MARK: - CodeModulePresenter API
extension CodeModulePresenter: CodeModulePresenterApi {
}

// MARK: - CodeModule Viper Components
private extension CodeModulePresenter {
    var view: CodeModuleViewApi {
        return _view as! CodeModuleViewApi
    }
    var interactor: CodeModuleInteractorApi {
        return _interactor as! CodeModuleInteractorApi
    }
    var router: CodeModuleRouterApi {
        return _router as! CodeModuleRouterApi
    }
}
