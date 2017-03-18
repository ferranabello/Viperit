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
    
    }

    func testModuleBuilderPerformance() {
        self.measure {
            _ = Module.build(TestModules.sample, bundle: Bundle(for: SampleRouter.self))
        }
    }
}
