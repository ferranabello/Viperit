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
        
        if  let _ = module.view as? SampleView,
            let _ = module.interactor as? SampleInteractor,
            let _ = module.presenter as? SamplePresenter,
            let _ = module.router as? SampleRouter,
            let _ = module.displayData as? SampleDisplayData {
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
