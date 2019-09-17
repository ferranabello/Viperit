//
//  CoolInteractor.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - CoolInteractor Class
final class CoolInteractor: Interactor {
}

// MARK: - CoolInteractor API
extension CoolInteractor: CoolInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension CoolInteractor {
    var presenter: CoolPresenterApi {
        return _presenter as! CoolPresenterApi
    }
}
