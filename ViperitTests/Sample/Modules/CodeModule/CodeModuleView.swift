//
//  CodeModuleView.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//Copyright © 2017 Ferran Abelló. All rights reserved.
//

import UIKit
import Viperit

//MARK: CodeModuleView Class
final class CodeModuleView: UserInterface {
}

//MARK: - CodeModuleView API
extension CodeModuleView: CodeModuleViewApi {
}

// MARK: - CodeModuleView Viper Components API
private extension CodeModuleView {
    var presenter: CodeModulePresenterApi {
        return _presenter as! CodeModulePresenterApi
    }
    var displayData: CodeModuleDisplayData {
        return _displayData as! CodeModuleDisplayData
    }
}
