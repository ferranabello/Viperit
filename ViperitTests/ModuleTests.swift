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
    func testModuleBuilderPerformance() {
        self.measure {
            _ = Module.build(TestModules.sample, bundle: Bundle(for: SampleRouter.self))
        }
    }
    
    func testModuleBuildCorrectComponents() {
        let module = Module.build(TestModules.sample, bundle: Bundle(for: SampleRouter.self))
    
        if  module.view is SampleView,
            module.interactor is SampleInteractor,
            module.presenter is SamplePresenter,
            module.router is SampleRouter,
            module.displayData is SampleDisplayData {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
}
