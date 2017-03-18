//
//  ModuleTests.swift
//  Viperit
//
//  Created by Ferran Abelló on 17/03/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import XCTest
import Viperit

private enum TestModules: String, ViperitModule {
    case sample
}

class ModuleTests: XCTestCase {
    
    func testModuleBuildCorrectComponents() {
        let module = Module.build(TestModules.sample, bundle: Bundle(for: SampleRouter.self))
        
        if  let v = module.view as? SampleView,
            let i = module.interactor as? SampleInteractor,
            let p = module.presenter as? SamplePresenter,
            let r = module.router as? SampleRouter,
            let d = module.displayData as? SampleDisplayData {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }

    func testModuleBuilderPerformance() {
        self.measure {
            _ = Module.build(TestModules.sample, bundle: Bundle(for: SampleRouter.self))
        }
    }
}
