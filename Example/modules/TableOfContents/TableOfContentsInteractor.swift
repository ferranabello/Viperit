//
//  TableOfContentsInteractor.swift
//  Viperit
//
//  Created by Ferran on 01/04/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - TableOfContentsInteractor Class
final class TableOfContentsInteractor: Interactor {
}

// MARK: - TableOfContentsInteractor API
extension TableOfContentsInteractor: TableOfContentsInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension TableOfContentsInteractor {
    var presenter: TableOfContentsPresenterApi {
        return _presenter as! TableOfContentsPresenterApi
    }
}
