//
//  AppDelegate.swift
//  Viperit
//
//  Created by Ferran on 11/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import UIKit
import Viperit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
       
        let module = AppModules.cool.build { presenter -> (CoolView, UserSettings) in
            let p = presenter as! CoolPresenterApi
            let settings = p.settings()
            return (CoolView(presenter: p), settings)
        }
        
        let router = module.router as! CoolRouter
        router.show(inWindow: window)
        
        return true
    }

}

