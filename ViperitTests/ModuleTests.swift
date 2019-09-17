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
    private lazy var testBundle = Bundle(for: SampleRouter.self)
    
    private func createTestModule(module: TestModules = .sample, forTablet: Bool = false) -> Module {
        let deviceType: UIUserInterfaceIdiom = forTablet ? .pad : .phone
        return module.build(bundle: testBundle, deviceType: deviceType)
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
        
        XCTAssert(v._presenter is SamplePresenter)
        XCTAssert(v._displayData is SampleDisplayData)
        XCTAssert(i._presenter is SamplePresenter)
        XCTAssert(p._view is SampleView)
        XCTAssert(p._router is SampleRouter)
        XCTAssert(r._presenter is SamplePresenter)
        XCTAssert(r._view is SampleView)
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
        XCTAssert(v._presenter is SamplePresenter)
        XCTAssert(v._displayData is SampleDisplayData)
        XCTAssert(p._view is MockView)
        XCTAssert(r._view is MockView)
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
        XCTAssert(p._view is SampleView)
        XCTAssert(p._interactor is SampleInteractor)
        XCTAssert(p._router is SampleRouter)
        XCTAssert(r._presenter is MockPresenter)
        XCTAssert(v._presenter is MockPresenter)
        XCTAssert(i._presenter is MockPresenter)
    }
    
    func testMockInteractorInjection() {
        var module = createTestModule()
        let mockInteractor = MockInteractor()
        module.injectMock(interactor: mockInteractor)
        
        //Assert new injected dependencies
        let i = module.interactor
        let p = module.presenter
        
        XCTAssert(i is MockInteractor)
        XCTAssert(i._presenter is SamplePresenter)
        XCTAssert(p._interactor is MockInteractor)
    }
    
    func testMockRouterInjection() {
        var module = createTestModule()
        let mockRouter = MockRouter()
        module.injectMock(router: mockRouter)
        
        //Assert new injected dependencies
        let p = module.presenter
        let r = module.router
        
        XCTAssert(r is MockRouter)
        XCTAssert(r._presenter is SamplePresenter)
        XCTAssert(p._router is MockRouter)
    }
    
    func testModuleFromNib() {
        let module = createTestModule(module: .xibModule)
        XCTAssert(module.view is XibModuleView)
    }
    
    func testModuleByCode() {
        let module = createTestModule(module: .codeModule)
        XCTAssert(module.view is CodeModuleView)
    }
    
    func testModuleWithoutOverridingProperties() {
        let module = TestCleanModules.sample.build(bundle: testBundle, deviceType: .phone)
        XCTAssert(module.view is SampleView)
    }
}

//MARK: - SwiftUI tests
@available(iOS 13.0, *)
extension ModuleTests {
    private func createSwiftUIModule() -> Module {
        return TestModules.swiftUI.build(bundle: testBundle, deviceType: nil) { presenter in
            SwiftUIView(presenter: presenter as? SwiftUIPresenterApi)
        }
    }
    
    private func createSwiftUIModuleWithEnvironmentObject() -> Module {
        return TestModules.swiftUIWithEnv.build(bundle: testBundle, deviceType: nil) { presenter -> (SwiftUIWithEnvView, Settings) in
            let view = SwiftUIWithEnvView(presenter: presenter as? SwiftUIWithEnvPresenterApi)
            let settings = Settings()
            return (view, settings)
        }
    }
    
    func testSwiftUIModuleBuilderPerformance() {
        self.measure {
            _ = self.createSwiftUIModule()
        }
    }
    
    func testSwiftUIWithEnvironmentObjectModuleBuilderPerformance() {
        self.measure {
            _ = self.createSwiftUIModuleWithEnvironmentObject()
        }
    }
    
    func testSwiftUIModuleBuildCorrectComponents() {
        let module = createSwiftUIModule()
        
        XCTAssert(module.view is HostingUserInterface<SwiftUIView>)
        XCTAssert(module.interactor is SwiftUIInteractor)
        XCTAssert(module.presenter is SwiftUIPresenter)
        XCTAssert(module.router is SwiftUIRouter)
        XCTAssertNil(module.displayData)
    }
    
    func testSwiftUIWithEnvironmentObjectModuleBuildCorrectComponents() {
        let module = createSwiftUIModuleWithEnvironmentObject()
        
        XCTAssert(module.interactor is SwiftUIWithEnvInteractor)
        XCTAssert(module.presenter is SwiftUIWithEnvPresenter)
        XCTAssert(module.router is SwiftUIWithEnvRouter)
        XCTAssertNil(module.displayData)
    }
}
