//
//  HomeInteractor.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import Foundation

final class HomeInteractor: Interactor {
    func someInteractorOperation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.presenter.reactToSomeInteractorOperation()
        }
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HomeInteractor {
    var presenter: HomePresenter {
        return _presenter as! HomePresenter
    }
}
