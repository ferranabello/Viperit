//
//  SecondViewPad.swift
//  Viperit
//
//  Created by Ferran on 10/11/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit

//MARK: Second View for Tablet
final class SecondViewPad: UserInterface {
}

//MARK: - Public interface implementation
extension SecondViewPad: SecondViewInterface {
    @IBAction func close() {
        presenter.close()
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SecondViewPad {
    var presenter: SecondPresenter {
        return _presenter as! SecondPresenter
    }
    var displayData: SecondDisplayData {
        return _displayData as! SecondDisplayData
    }
}
