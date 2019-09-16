//
//  CoolPresenter.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation
import Viperit

// MARK: - CoolPresenter Class
final class CoolPresenter: Presenter {
    var _viewModel: UserSettings!
    
    override func viewHasAppeared() {
        print("The swiftUI host has appeared!")
    }
}

// MARK: - CoolPresenter API
extension CoolPresenter: CoolPresenterApi {
    func settings() -> UserSettings {
        _viewModel = UserSettings()
        return _viewModel
    }
    
    func changeRandomName() {
        _viewModel.randomName = "Loading..."
        DispatchQueue.global(qos: .background).async { [weak self] in
            let url = URL(string: "https://www.random.org/strings/?num=1&len=10&upperalpha=on&loweralpha=on&unique=off&format=plain")!
            
            let name = try! String(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
                self?._viewModel.randomName = name
            }
        }
    }

    
    func changeScore () {
        _viewModel.score += 1
    }
}

// MARK: - Cool Viper Components
private extension CoolPresenter {
    var interactor: CoolInteractorApi {
        return _interactor as! CoolInteractorApi
    }
    var router: CoolRouterApi {
        return _router as! CoolRouterApi
    }
}
