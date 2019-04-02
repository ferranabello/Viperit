//
//  TableOfContentsModuleApi.swift
//  Viperit
//
//  Created by Ferran on 01/04/2019.
//Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Viperit

//MARK: - TableOfContentsRouter API
protocol TableOfContentsRouterApi: RouterProtocol {
    func goHome()
}

//MARK: - TableOfContentsView API
protocol TableOfContentsViewApi: UserInterfaceProtocol {
}

//MARK: - TableOfContentsPresenter API
protocol TableOfContentsPresenterApi: PresenterProtocol {
    func showHome()
}

//MARK: - TableOfContentsInteractor API
protocol TableOfContentsInteractorApi: InteractorProtocol {
}
