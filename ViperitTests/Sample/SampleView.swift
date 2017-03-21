//
//  SampleView.swift
//  Viperit
//
//  Created by Ferran Abelló on 17/03/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol SampleViewInterface {
}

//MARK: Sample View
final class SampleView: UserInterface {
}

//MARK: - Public interface
extension SampleView: SampleViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SampleView {
    var presenter: SamplePresenterInterface {
        return _presenter as! SamplePresenterInterface
    }
    var displayData: SampleDisplayData {
        return _displayData as! SampleDisplayData
    }
}
