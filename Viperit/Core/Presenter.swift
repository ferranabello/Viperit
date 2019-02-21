//
//  Presenter.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

public protocol PresenterProtocol {
    var _interactor: Interactor! { get set }
    var _view: Any! { get set }
    var _router: Router! { get set }
        
    func setupView(data: Any)
    func viewHasLoaded()
    func viewIsAboutToAppear()
    func viewHasAppeared()
    func viewIsAboutToDisappear()
    func viewHasDisappeared()
}

open class Presenter: PresenterProtocol {
    public var _interactor: Interactor!
    public var _view: Any!
    public var _router: Router!
    
    required public init() { }
    
    open func setupView(data: Any) {
        print(ViperitError.methodNotImplemented.description)
    }
    
    open func viewHasLoaded() {}
    open func viewIsAboutToAppear() {}
    open func viewHasAppeared() {}
    open func viewIsAboutToDisappear() {}
    open func viewHasDisappeared() {}
}
