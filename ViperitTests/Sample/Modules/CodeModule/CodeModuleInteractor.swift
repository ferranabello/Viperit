//
//  CodeModuleInteractor.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//Copyright © 2017 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - CodeModuleInteractor Class
final class CodeModuleInteractor: Interactor {
}

// MARK: - CodeModuleInteractor API
extension CodeModuleInteractor: CodeModuleInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension CodeModuleInteractor {
    var presenter: CodeModulePresenterApi {
        return _presenter as! CodeModulePresenterApi
    }
}
