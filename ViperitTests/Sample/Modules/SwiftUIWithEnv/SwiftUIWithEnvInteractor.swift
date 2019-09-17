//
//  SwiftUIWithEnvInteractor.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SwiftUIWithEnvInteractor Class
final class SwiftUIWithEnvInteractor: Interactor {
}

// MARK: - SwiftUIWithEnvInteractor API
extension SwiftUIWithEnvInteractor: SwiftUIWithEnvInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension SwiftUIWithEnvInteractor {
    var presenter: SwiftUIWithEnvPresenterApi {
        return _presenter as! SwiftUIWithEnvPresenterApi
    }
}
