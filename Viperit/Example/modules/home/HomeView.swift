//
//  HomeView.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit


//MARK: - Public Interface Protocol
protocol HomeViewInterface {
    func showLoading()
    func showInfo(message: String)
}

//MARK: Home View
final class HomeView: UserInterface {
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.loadContent()
    }
    
    @IBAction func goToSecondModuleButtonPressed() {
        presenter.showSecondModule()
    }
}

//MARK: - Public interface
extension HomeView: HomeViewInterface {
    func showLoading() {
        messageLabel.text = displayData.loadingText
    }
    func showInfo(message: String) {
        messageLabel.text = message
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension HomeView {
    var presenter: HomePresenter {
        return _presenter as! HomePresenter
    }
    var displayData: HomeDisplayData {
        return _displayData as! HomeDisplayData
    }
}


