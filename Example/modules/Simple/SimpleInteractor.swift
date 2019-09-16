//
//  SimpleInteractor.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SimpleInteractor Class
final class SimpleInteractor: Interactor {
}

// MARK: - SimpleInteractor API
extension SimpleInteractor: SimpleInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension SimpleInteractor {
    var presenter: SimplePresenterApi {
        return _presenter as! SimplePresenterApi
    }
}
