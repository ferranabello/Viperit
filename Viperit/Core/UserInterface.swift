//
//  UserInterface.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit

public protocol UserInterfaceProtocol: AnyObject {
    var _presenter: PresenterProtocol! { get set }
    var _displayData: DisplayData? { get set }
    var viewController: UIViewController { get }
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

public extension UserInterfaceProtocol {
    var viewController: UIViewController {
        return self as! UIViewController
    }
}

//MARK: - Default implementation for UIViewController
open class UserInterface: UIViewController, UserInterfaceProtocol {
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
