//
//  CoolModuleApi.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Viperit

//MARK: - CoolRouter API
protocol CoolRouterApi: RouterProtocol {
    func goToPerfect()
}

//MARK: - CoolPresenter API
protocol CoolPresenterApi: PresenterProtocol {
    func settings() -> UserSettings
    func changeScore()
    func changeRandomName()
    func showAnotherModule()
}

//MARK: - CoolInteractor API
protocol CoolInteractorApi: InteractorProtocol {
}
