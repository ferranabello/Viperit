//
//  SecondPresenter.swift
//  Viperit
//
//  Created by Ferran on 10/11/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

final class SecondPresenter: Presenter {
    
    func close() {
        router.close()
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SecondPresenter {
    var view: SecondViewInterface {
        return _view as! SecondViewInterface
    }
    var interactor: SecondInteractor {
        return _interactor as! SecondInteractor
    }
    var router: SecondRouter {
        return _router as! SecondRouter
    }
}
