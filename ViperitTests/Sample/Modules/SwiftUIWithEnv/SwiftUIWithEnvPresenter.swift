//
//  SwiftUIWithEnvPresenter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SwiftUIWithEnvPresenter Class
final class SwiftUIWithEnvPresenter: Presenter {
}

// MARK: - SwiftUIWithEnvPresenter API
extension SwiftUIWithEnvPresenter: SwiftUIWithEnvPresenterApi {
}

// MARK: - SwiftUIWithEnv Viper Components
private extension SwiftUIWithEnvPresenter {
    var interactor: SwiftUIWithEnvInteractorApi {
        return _interactor as! SwiftUIWithEnvInteractorApi
    }
    var router: SwiftUIWithEnvRouterApi {
        return _router as! SwiftUIWithEnvRouterApi
    }
}
