//
//  CoolModuleApi.swift
//  Viperit
//
//  Created by Ferran on 17/06/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Viperit
import SwiftUI

//MARK: - CoolRouter API
protocol CoolRouterApi: RouterProtocol {
}

//MARK: - CoolView API
protocol CoolViewApi: UserInterfaceProtocol {
}

//MARK: - CoolPresenter API
protocol CoolPresenterApi: PresenterProtocol {
    func settings() -> UserSettings
    func changeScore()
    func changeRandomName()
}

//MARK: - CoolInteractor API
protocol CoolInteractorApi: InteractorProtocol {
}
