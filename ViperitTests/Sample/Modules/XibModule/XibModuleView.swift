//
//  XibModuleView.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//Copyright © 2017 Ferran Abelló. All rights reserved.
//

import UIKit
import Viperit

//MARK: XibModuleView Class
final class XibModuleView: UserInterface {
}

//MARK: - XibModuleView API
extension XibModuleView: XibModuleViewApi {
}

// MARK: - XibModuleView Viper Components API
private extension XibModuleView {
    var presenter: XibModulePresenterApi {
        return _presenter as! XibModulePresenterApi
    }
    var displayData: XibModuleDisplayData {
        return _displayData as! XibModuleDisplayData
    }
}
