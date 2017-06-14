//
//  XibModuleInteractor.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//Copyright © 2017 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - XibModuleInteractor Class
final class XibModuleInteractor: Interactor {
}

// MARK: - XibModuleInteractor API
extension XibModuleInteractor: XibModuleInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension XibModuleInteractor {
    var presenter: XibModulePresenterApi {
        return _presenter as! XibModulePresenterApi
    }
}
