//
//  UserInterface+Split.swift
//  Viperit
//
//  Created by Ferran on 01/04/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import UIKit

//MARK: - Default implementation for UISplitViewController
open class SplitUserInterface: UISplitViewController, UserInterfaceProtocol {
    public var _presenter: PresenterProtocol!
    public var _displayData: DisplayData?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        _presenter.viewHasLoaded()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _presenter.viewIsAboutToAppear()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _presenter.viewHasAppeared()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _presenter.viewIsAboutToDisappear()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        _presenter.viewHasDisappeared()
    }
}
