//
//  Presenter.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

open class Presenter {
    public var _interactor: Interactor!
    public weak var _view: UserInterface!
    public var _router: Router!
    
    required public init() { }
    
    open func setupView(data: Any) {}
    
    open func viewHasLoaded() {}
    open func viewIsAboutToAppear() {}
    open func viewHasAppeared() {}
    open func viewIsAboutToDisappear() {}
    open func viewHasDisappeared() {}
}
