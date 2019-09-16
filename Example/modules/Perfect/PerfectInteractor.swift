//
//  PerfectInteractor.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - PerfectInteractor Class
final class PerfectInteractor: Interactor {
}

// MARK: - PerfectInteractor API
extension PerfectInteractor: PerfectInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension PerfectInteractor {
    var presenter: PerfectPresenterApi {
        return _presenter as! PerfectPresenterApi
    }
}
