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
    private func createTestModule(forTablet: Bool = false) -> Module {
        let deviceType: UIUserInterfaceIdiom = forTablet ? .pad : .phone
        return TestModules.sample.build(bundle: Bundle(for: SampleRouter.self), deviceType: deviceType)
    }
    
    func testEmbedInNavigationController() {
        let module = createTestModule()
        let router = module.router as! SampleRouter
        let navigationController = router.embedInNavigationController()
        
        //Check that there is one view in the stack and that is a SampleView
        assert(navigationController.viewControllers.count == 1)
        assert(navigationController.viewControllers[0] is SampleView)
    }
    
    func testEmbedInNavigationControllerWhenAlreadyExists() {
        let module = createTestModule()
        let router = module.router as! SampleRouter
        let navController = UINavigationController(rootViewController: UIViewController())
        navController.pushViewController(module.view.viewController, animated: false)
        let navigationController = router.embedInNavigationController()
        
        //Check that there is two views in the stack and that the second one is a SampleView
        assert(navigationController.viewControllers.count == 2)
        assert(navigationController.viewControllers[1] is SampleView)
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
    
    func testShowEmbeddedInNavigationController() {
        let mockView = UIViewController()
        let module = createTestModule()
        let router = module.router as! SampleRouter
        
        router.show(from: mockView, embedInNavController: true)
        let navigationController = module.view.viewController.navigationController
        
        //Check that there is one view in the stack and that is a SampleView
        assert(navigationController != nil)
        assert(navigationController?.viewControllers.count == 1)
        assert(navigationController?.viewControllers[0] is SampleView)
    }
    
    func testShowInsideView() {
        let mockView = UIViewController()
        let targetView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        mockView.view.addSubview(targetView)
        
        let module = createTestModule()
        let router = module.router as! SampleRouter
        module.view.viewController.view.tag = 150
        router.show(from: mockView, insideView: targetView)
        
        guard targetView.subviews.count == 1 else {
            XCTAssert(false)
            return
        }
        
        let extractedView = targetView.subviews[0]
        XCTAssert(extractedView.tag == 150)
    }
    
    func testPresentDefault() {
        let window = UIWindow()
        let mockRootModule = createTestModule()
        let rootRouter = mockRootModule.router as! SampleRouter
        let presentedModule = createTestModule()
        let presentedRouter = presentedModule.router as! SampleRouter
        
        
        //Setup window
        rootRouter.show(inWindow: window, embedInNavController: true, makeKeyAndVisible: false)
        
        //Setup presented view to check values afterwards
        let presentedTitle: String? = "MODALLY PRESENTED MODULE"
        presentedModule.view.viewController.title = presentedTitle
        presentedModule.view.viewController.view?.backgroundColor = .red
        
        presentedRouter.present(from: mockRootModule.view.viewController) {
            guard let topController = self.getTopViewController(window: window) else {
                XCTAssert(false, "No top ViewController found")
                return
            }
            
            XCTAssert(topController.view?.backgroundColor == .red)
            XCTAssertEqual(topController.title, presentedTitle)
            XCTAssertEqual(topController, presentedModule.view.viewController)
        }
    }
    
    func testPresentEmbeddedInNavController() {
        let window = UIWindow()
        let mockRootModule = createTestModule()
        let rootRouter = mockRootModule.router as! SampleRouter
        let presentedModule = createTestModule()
        let presentedRouter = presentedModule.router as! SampleRouter
        
        //Setup window
        rootRouter.show(inWindow: window, embedInNavController: true, setupData: nil, makeKeyAndVisible: false)
        
        presentedRouter.present(from: mockRootModule.view.viewController) {
            //Setup presented module view to check values afterwards
            let presentedTitle: String? = "MODALLY PRESENTED MODULE EMBEDDED IN NAVIGATION CONTROLLER"
            presentedModule.view.viewController.title = presentedTitle
            presentedModule.view.viewController.view?.backgroundColor = .blue
            presentedModule.view.viewController.navigationItem.title = presentedTitle
            
            guard let topNavController = self.getTopViewController(window: window) as? UINavigationController else {
                XCTAssert(false, "No top navigation controller found")
                return
            }
            
            let presentedRootController = topNavController.topViewController
            XCTAssertNotNil(presentedRootController, "No root view controller found")
            XCTAssert(presentedRootController?.view?.backgroundColor == .blue)
            XCTAssertEqual(presentedRootController?.title, presentedTitle)
            XCTAssertEqual(presentedRootController?.navigationItem.title, presentedTitle)
            XCTAssertEqual(topNavController.viewControllers.count, 1)
            XCTAssertEqual(presentedRootController, presentedModule.view.viewController)
        }
    }
    
    func testDismissModal() {
        let window = UIWindow()
        let mockRootModule = createTestModule()
        let rootRouter = mockRootModule.router as! SampleRouter
        let presentedModule = createTestModule()
        let presentedRouter = presentedModule.router as! SampleRouter
        
        //Setup window
        rootRouter.show(inWindow: window, embedInNavController: false, setupData: nil, makeKeyAndVisible: false)
        
        presentedRouter.present(from: mockRootModule.view.viewController) {
            XCTAssertEqual(mockRootModule.view.viewController.presentedViewController, presentedModule.view.viewController)
            presentedRouter.dismiss(animated: false, completion: {
                XCTAssertNil(mockRootModule.view.viewController.presentedViewController)
            })
        }
    }
}

//MARK: - Helpers
private extension RouterTests {
    func getTopViewController(window: UIWindow) -> UIViewController? {
        if var topController = window.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        return nil
    }
}
