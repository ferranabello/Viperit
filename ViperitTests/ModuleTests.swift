//
//  ModuleTests.swift
//  Viperit
//
//  Created by Ferran Abelló on 17/03/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import XCTest
import Viperit

private class SampleMockView: UserInterface {}

class ModuleTests: XCTestCase {
    private func createTestModule() -> Module {
        return Module.build(TestModules.sample, bundle: Bundle(for: SampleRouter.self))
    }
    
    func testModuleBuilderPerformance() {
        self.measure {
            _ = self.createTestModule()
        }
    }
    
    func testModuleBuildCorrectComponents() {
        let module = createTestModule()
        
        XCTAssert(module.view is SampleView)
        XCTAssert(module.interactor is SampleInteractor)
        XCTAssert(module.presenter is SamplePresenter)
        XCTAssert(module.router is SampleRouter)
        XCTAssert(module.displayData is SampleDisplayData)
    }
    
    func testModuleDepencies() {
        let module = createTestModule()
        
        //Assert view dependencies
        let v = module.view
        let i = module.interactor
        let p = module.presenter
        let r = module.router
        
        XCTAssert(v?._presenter is SamplePresenter)
        XCTAssert(v?._displayData is SampleDisplayData)
        XCTAssert(i?._presenter is SamplePresenter)
        XCTAssert(p?._view is SampleView)
        XCTAssert(p?._router is SampleRouter)
        XCTAssert(r?._presenter is SamplePresenter)
        XCTAssert(r?._view is SampleView)        
    }
    
    func testMockViewInjection() {
        var module = createTestModule()
        let mockView = SampleMockView()
        module.injectMock(view: mockView)
        
        //Assert new injected dependencies
        let v = module.view
        let p = module.presenter
        let r = module.router
        
        XCTAssert(v is SampleMockView)
        XCTAssert(v?._presenter is SamplePresenter)
        XCTAssert(v?._displayData is SampleDisplayData)
        XCTAssert(p?._view is SampleMockView)
        XCTAssert(r?._view is SampleMockView)
    }
}
