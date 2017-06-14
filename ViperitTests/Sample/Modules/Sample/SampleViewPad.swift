//
//  SampleViewPad.swift
//  Viperit
//
//  Created by Ferran Abelló on 20/03/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import UIKit
import Viperit

//MARK: Sample View for Tablet
final class SampleViewPad: UserInterface {
}

//MARK: - Public interface implementation
extension SampleViewPad: SampleViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SampleViewPad {
    var presenter: SamplePresenter {
        return _presenter as! SamplePresenter
    }
    var displayData: SampleDisplayData {
        return _displayData as! SampleDisplayData
    }
}
