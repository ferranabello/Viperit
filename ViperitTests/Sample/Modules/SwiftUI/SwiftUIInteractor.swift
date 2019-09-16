//
//  SwiftUIInteractor.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SwiftUIInteractor Class
final class SwiftUIInteractor: Interactor {
}

// MARK: - SwiftUIInteractor API
extension SwiftUIInteractor: SwiftUIInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension SwiftUIInteractor {
    var presenter: SwiftUIPresenterApi {
        return _presenter as! SwiftUIPresenterApi
    }
}
