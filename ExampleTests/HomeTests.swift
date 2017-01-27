//
//  ViperitTests.swift
//  ViperitTests
//
//  Created by Ferran on 17/09/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

@testable import Example
import Viperit
import XCTest

class HomeMockView: UserInterface, HomeViewInterface {
    
    //TEST PROPERTIES
    var expectation: XCTestExpectation!
    var expectedMessage: String!
    
    func showInfo(message: String) {
        print("EXPECTED MESSAGE : \(expectedMessage!)")
        XCTAssert(message == expectedMessage)
        expectation.fulfill()
    }
    
    func showLoading() {
        //
    }
}

class HomeTests: XCTestCase {
    
    var view: HomeMockView!
    var presenter: HomePresenter!
    
    override func setUp() {
        super.setUp()
        var mod = Module.build(AppModules.home)
        view = HomeMockView()
        view.expectation = expectation(description: "Test expectation description")
        presenter = mod.presenter as! HomePresenter
        mod.injectMock(view: view)
    }
    
    func expect(timeout: TimeInterval = 5, errorMessage: String = "TIMEOUT") {
        waitForExpectations(timeout: 5) { error in
            guard error != nil else { return }
            XCTFail(errorMessage)
        }
    }
    
    func testShowInfo1() {
        print("---RUNNING TEST1---")
        view.expectedMessage = "CONTENT_LOADED"
        presenter.loadContent()
        expect()
    }
    
    func testShowInfo2() {
        print("---RUNNING TEST2---")
        view.expectedMessage = "CONTENT_LOADED"
        presenter.loadContent()
        expect()
    }
}
