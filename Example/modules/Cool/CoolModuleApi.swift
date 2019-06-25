//
//  CoolModuleApi.swift
//  Viperit
//
//  Created by Ferran on 17/06/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Viperit

//MARK: - CoolRouter API
protocol CoolRouterApi: RouterProtocol {
}

//MARK: - CoolView API
protocol CoolViewApi: UserInterfaceProtocol {
}

//MARK: - CoolPresenter API
protocol CoolPresenterApi: PresenterProtocol {
    func whatsMyName() -> String
}

//MARK: - CoolInteractor API
protocol CoolInteractorApi: InteractorProtocol {
}
