//
//  PerfectPresenter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - PerfectPresenter Class
final class PerfectPresenter: Presenter {
}

// MARK: - PerfectPresenter API
extension PerfectPresenter: PerfectPresenterApi {
}

// MARK: - Perfect Viper Components
private extension PerfectPresenter {
    var interactor: PerfectInteractorApi {
        return _interactor as! PerfectInteractorApi
    }
    var router: PerfectRouterApi {
        return _router as! PerfectRouterApi
    }
}
