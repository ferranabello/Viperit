//
//  RouterTests.swift
//  Viperit
//
//  Created by Ferran Abelló on 20/03/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import XCTest
import Viperit

class RouterTests: XCTestCase {
    private func createTestModule() -> Module {
        return Module.build(TestModules.sample, bundle: Bundle(for: SampleRouter.self))
    }
    
    func testEmbedInNavigationController() {
        let module = createTestModule()
        let router = module.router as! SampleRouter
        let navigationController = router.embedInNavigationController()
        
        //Check that there is one view in the stack and that is a SampleView
        assert(navigationController.viewControllers.count == 1)
        assert(navigationController.viewControllers[0] is SampleView)
    }
    
    func testShowInWindow() {
        let window = UIWindow()
        let module = createTestModule()
        module.router.show(inWindow: window, embedInNavController: false, setupData: nil, makeKeyAndVisible: false)
        XCTAssert(window.rootViewController is SampleView)
    }
    
    func testShowInWindowEmbeddedInNavigationController() {
        let window = UIWindow()
        let module = createTestModule()
        module.router.show(inWindow: window, embedInNavController: true, setupData: nil, makeKeyAndVisible: false)
        
        guard let rootNav = window.rootViewController as? UINavigationController,
            let _ = rootNav.viewControllers[0] as? SampleView else {
                XCTAssert(false)
                return
        }
        XCTAssert(true)
    }
    
    func testShowInsideView() {
        let mockView = UIViewController()
        let targetView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        mockView.view.addSubview(targetView)
        
        let module = createTestModule()
        module.view.view.tag = 150
        module.router.show(from: mockView, insideView: targetView)
        
        guard targetView.subviews.count == 1 else {
            XCTAssert(false)
            return
        }
        
        let extractedView = targetView.subviews[0]
        XCTAssert(extractedView.tag == 150)
    }
}
