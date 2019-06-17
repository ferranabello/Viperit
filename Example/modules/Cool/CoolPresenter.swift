//
//  CoolPresenter.swift
//  Viperit
//
//  Created by Ferran on 17/06/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - CoolPresenter Class
final class CoolPresenter: Presenter {
}

// MARK: - CoolPresenter API
extension CoolPresenter: CoolPresenterApi {
}

// MARK: - Cool Viper Components
private extension CoolPresenter {
    var view: CoolViewApi {
        return _view as! CoolViewApi
    }
    var interactor: CoolInteractorApi {
        return _interactor as! CoolInteractorApi
    }
    var router: CoolRouterApi {
        return _router as! CoolRouterApi
    }
}
