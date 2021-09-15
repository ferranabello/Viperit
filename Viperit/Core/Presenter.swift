//
//  Presenter.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

public protocol PresenterProtocol: AnyObject, ViperitComponent {
    var _interactor: InteractorProtocol! { get set }
    var _view: UserInterfaceProtocol! { get set }
    var _router: RouterProtocol! { get set }
        
    func setupView(data: Any)
    func viewHasLoaded()
    func viewIsAboutToAppear()
    func viewHasAppeared()
    func viewIsAboutToDisappear()
    func viewHasDisappeared()
}

open class Presenter: PresenterProtocol {
    public var _interactor: InteractorProtocol!
    public weak var _view: UserInterfaceProtocol!
    public var _router: RouterProtocol!
    
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
