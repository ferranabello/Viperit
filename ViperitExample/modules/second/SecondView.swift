//
//  SecondView.swift
//  Viperit
//
//  Created by Ferran on 10/11/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol SecondViewInterface {
}

//MARK: Second View
final class SecondView: UserInterface {
    
    @IBAction func closeButtonPressed() {
        presenter.close()
    }
}

//MARK: - Public interface
extension SecondView: SecondViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SecondView {
    var presenter: SecondPresenter {
        return _presenter as! SecondPresenter
    }
    var displayData: SecondDisplayData {
        return _displayData as! SecondDisplayData
    }
}
