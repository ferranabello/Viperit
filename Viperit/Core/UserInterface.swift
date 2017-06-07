//
//  UserInterface.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit

public protocol UserInterfaceProtocol {
    var _presenter: Presenter! { get set }
    var _displayData: DisplayData! { get set }
}


open class UserInterface: UIViewController, UserInterfaceProtocol {
    public var _presenter: Presenter!
    public var _displayData: DisplayData!
    
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
