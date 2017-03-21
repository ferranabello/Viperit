//
//  PresenterTests.swift
//  Viperit
//
//  Created by Ferran Abelló on 21/03/2017.
//  Copyright © 2017 Ferran Abelló. All rights reserved.
//

import XCTest
import Viperit

//MARK: - Timeout
private let kTimeout: TimeInterval = 0.5

//MARK: - View Lifecycle
private let kViewHasLoaded = "viewHasLoaded"
private let kViewIsAboutToAppear = "viewIsAboutToAppear"
private let kViewHasAppeared = "viewHasAppeared"
private let kViewIsAboutToDisappear = "viewIsAboutToDisappear"
private let kViewHasDisappeared = "viewHasDisappeared"

//MARK: - Setup methods
private let kSetupView = "setupView"

//MARK: - Mock Presenter
private class MockPresenter: Presenter, SamplePresenterInterface {
    var expectation: XCTestExpectation!
    var methodExpected: String!
    
    private func assert(method: String) {
        if methodExpected == method {
            XCTAssert(true)
            expectation.fulfill()
        }
    }
    
    override func viewHasLoaded() {
        assert(method: kViewHasLoaded)
    }
    
    override func viewIsAboutToAppear() {
        assert(method: kViewIsAboutToAppear)
    }
    
    override func viewHasAppeared() {
        assert(method: kViewHasAppeared)
    }
    
    override func viewIsAboutToDisappear() {
        assert(method: kViewIsAboutToDisappear)
    }
    
    override func viewHasDisappeared() {
        assert(method: kViewHasDisappeared)
    }
    
    override func setupView(data: Any) {
        assert(method: kSetupView)
    }
}

//MARK: - Presenter Tests
class PresenterTests: XCTestCase {
    private func createTestModuleWithMockPresenter(methodToTest: String) -> Module {
        var module = Module.build(TestModules.sample, bundle: Bundle(for: SampleRouter.self))
        let mockPresenter = MockPresenter()
        mockPresenter.expectation = expectation(description: "Expecting method: \(methodToTest)")
        mockPresenter.methodExpected = methodToTest
        module.injectMock(presenter: mockPresenter)
        return module
    }
    
    private func expectViewLifecycle(method: String) {
        let module = createTestModuleWithMockPresenter(methodToTest: method)
        
        //Simulate view lifecycle
        _ = module.view.view
        module.view.viewWillAppear(false)
        module.view.viewDidAppear(false)
        module.view.viewWillDisappear(false)
        module.view.viewDidDisappear(false)
        
        expect(timeout: kTimeout, errorMessage: "\(method) timed out (> \(kTimeout)s")
    }
    
    
    func testViewHasLoaded() {
        expectViewLifecycle(method: kViewHasLoaded)
    }
    
    func testViewIsAboutToAppear() {
        expectViewLifecycle(method: kViewIsAboutToAppear)
    }
    
    func testViewHasAppeared() {
        expectViewLifecycle(method: kViewHasAppeared)
    }
    
    func testSetupView() {
        let mockView = UIViewController()
        _ = mockView.view
        let module = createTestModuleWithMockPresenter(methodToTest: kSetupView)
        
        //Simulate show module with router function using setup data
        module.router.show(from: mockView, setupData: "randomData")
        expect(timeout: kTimeout, errorMessage: "\(kSetupView) timed out (> \(kTimeout)s")
    }
    
    
    func expect(timeout: TimeInterval, errorMessage: String) {
        waitForExpectations(timeout: timeout) { error in
            guard error != nil else { return }
            XCTFail(errorMessage)
        }
    }
    

}
