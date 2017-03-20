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
}
