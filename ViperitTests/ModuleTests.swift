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
    private func createTestModule(forTablet: Bool = false) -> Module {
        let deviceType: UIUserInterfaceIdiom = forTablet ? .pad : .phone
        return Module.build(TestModules.sample, bundle: Bundle(for: SampleRouter.self), deviceType: deviceType)
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
    
    func testModuleBuildForTabletComponents() {
        let module = createTestModule(forTablet: true)
        
        XCTAssert(module.view is SampleViewPad)
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
