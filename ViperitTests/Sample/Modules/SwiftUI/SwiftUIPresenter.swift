//
//  SwiftUIPresenter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SwiftUIPresenter Class
final class SwiftUIPresenter: Presenter {
}

// MARK: - SwiftUIPresenter API
extension SwiftUIPresenter: SwiftUIPresenterApi {
}

// MARK: - SwiftUI Viper Components
private extension SwiftUIPresenter {
    var interactor: SwiftUIInteractorApi {
        return _interactor as! SwiftUIInteractorApi
    }
    var router: SwiftUIRouterApi {
        return _router as! SwiftUIRouterApi
    }
}
