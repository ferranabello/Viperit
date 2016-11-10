//
//  SecondRouter.swift
//  Viperit
//
//  Created by Ferran on 10/11/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit

final class SecondRouter: Router {
    
    func close() {
        _view.dismiss(animated: true, completion: nil)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SecondRouter {
    var presenter: SecondPresenter {
        return _presenter as! SecondPresenter
    }
}
