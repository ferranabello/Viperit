//
//  HomePresenter.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

final class HomePresenter: Presenter {
    
    override func viewIsAboutToAppear() {
        loadContent()
    }
    
    func reactToSomeInteractorOperation() {
        print("Home Presenter Reacted to Some Interactor Operation")
        self.view.showInfo(message: "CONTENT_LOADED")
    }
    
    func showSecondModule() {
        router.showSecondModule()
    }
}

private extension HomePresenter {
    func loadContent() {
        view.showLoading()
        interactor.someInteractorOperation()
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HomePresenter {
    var view: HomeViewInterface {
        return _view as! HomeViewInterface
    }
    var interactor: HomeInteractor {
        return _interactor as! HomeInteractor
    }
    var router: HomeRouter {
        return _router as! HomeRouter
    }
}
