//
//  Interactor.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

public protocol InteractorProtocol {
    weak var _presenter: Presenter! { get set }
}

open class Interactor: InteractorProtocol {
    public weak var _presenter: Presenter!
    
    required public init() { }
}
