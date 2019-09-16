//
//  UserInterface+SwiftUI.swift
//  Viperit
//
//  Created by Ferran on 25/06/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13.0, *)
public class HostingUserInterface<Content: View>: UIHostingController<Content>, UserInterfaceProtocol {
    public required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public var _presenter: PresenterProtocol!
    public var _displayData: DisplayData?
    
    
    public override required init(rootView: Content) {
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
