//
//  ModuleTests.swift
//  Viperit
//
//  Created by Ferran Abelló on 17/03/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import XCTest
import Viperit

private class MockView: UserInterface {}
private class MockPresenter: Presenter {}
private class MockInteractor: Interactor {}
private class MockRouter: Router {}

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
        let mockView = MockView()
        module.injectMock(view: mockView)
        
        //Assert new injected dependencies
        let v = module.view
        let p = module.presenter
        let r = module.router
        
        XCTAssert(v is MockView)
        XCTAssert(v?._presenter is SamplePresenter)
        XCTAssert(v?._displayData is SampleDisplayData)
        XCTAssert(p?._view is MockView)
        XCTAssert(r?._view is MockView)
    }
    
    func testMockPresenterInjection() {
        var module = createTestModule()
        let mockPresenter = MockPresenter()
        module.injectMock(presenter: mockPresenter)
        
        //Assert new injected dependencies
        let v = module.view
        let i = module.interactor
        let p = module.presenter
        let r = module.router
        
        XCTAssert(p is MockPresenter)
        XCTAssert(p?._view is SampleView)
        XCTAssert(p?._interactor is SampleInteractor)
        XCTAssert(p?._router is SampleRouter)
        XCTAssert(r?._presenter is MockPresenter)
        XCTAssert(v?._presenter is MockPresenter)
        XCTAssert(i?._presenter is MockPresenter)
    }
    
    func testMockInteractorInjection() {
        var module = createTestModule()
        let mockInteractor = MockInteractor()
        module.injectMock(interactor: mockInteractor)
        
        //Assert new injected dependencies
        let i = module.interactor
        let p = module.presenter
        
        XCTAssert(i is MockInteractor)
        XCTAssert(i?._presenter is SamplePresenter)
        XCTAssert(p?._interactor is MockInteractor)
    }
    
    func testMockRouterInjection() {
        var module = createTestModule()
        let mockRouter = MockRouter()
        module.injectMock(router: mockRouter)
        
        //Assert new injected dependencies
        let p = module.presenter
        let r = module.router
        
        XCTAssert(r is MockRouter)
        XCTAssert(r?._presenter is SamplePresenter)
        XCTAssert(p?._router is MockRouter)
    }
}
