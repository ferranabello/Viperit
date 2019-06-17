//
//  ViperitModule.swift
//  Viperit
//
//  Created by Ferran Abelló on 14/06/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import UIKit

#if canImport(SwiftUI)
import SwiftUI
#endif


//MARK: - Module View Types
public enum ViperitViewType {
    case swiftUI
    case storyboard
    case nib
    case code
}

//MARK: - Viperit Module Protocol
public protocol ViperitModule {
    var viewType: ViperitViewType { get }
    var viewName: String { get }
    func build(bundle: Bundle, deviceType: UIUserInterfaceIdiom?) -> Module
    
    @available(iOS 13.0, *)
    func build<T: View>(bundle: Bundle, deviceType: UIUserInterfaceIdiom?, setupUI: (() -> T)?) -> Module
}

public extension ViperitModule where Self: RawRepresentable, Self.RawValue == String {
    var viewType: ViperitViewType {
        return .storyboard
    }
    
    var viewName: String {
        return rawValue
    }
    
    func build(bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil) -> Module {
        return Module.build(self, bundle: bundle, deviceType: deviceType)
    }
    
    @available(iOS 13.0, *)
    func build<T: View>(bundle: Bundle = Bundle.main, deviceType: UIUserInterfaceIdiom? = nil, setupUI: (() -> T)?) -> Module {
        if let setup = setupUI {
            let viewUI = setup()
            let view = ViperitHostingController(rootView: viewUI)
            return Module.build(self, bundle: bundle, deviceType: deviceType, injectedView: view)
        }
        return Module.build(self, bundle: bundle, deviceType: deviceType)
    }

}


@available(iOS 13.0, *)
public class ViperitHostingController<Content: View>: UIHostingController<Content>, UserInterfaceProtocol {
    public required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public var _presenter: PresenterProtocol!
    public var _displayData: DisplayData!
    
    
    public override required init(rootView: Content) {
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
