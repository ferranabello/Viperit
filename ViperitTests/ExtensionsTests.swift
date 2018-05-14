//
//  ExtensionsTests.swift
//  ViperitTests
//
//  Created by Ferran on 03/04/2018.
//  Copyright © 2018 Ferran Abelló. All rights reserved.
//

import XCTest
@testable import Viperit

class ExtensionsTests: XCTestCase {
    func testSafeNilString() {
        let optionalObject: String? = nil
        let nonOptionalString = safeString(optionalObject)
        XCTAssertEqual(nonOptionalString, "")
    }
    
    func testSafeFilledString() {
        let optionalObject: String? = "Hey there"
        let nonOptionalString = safeString(optionalObject)
        XCTAssertEqual(nonOptionalString, "Hey there")
    }
    
    func testUppercasedFirst() {
        let noUpperCased = "hey there"
        let uppercasedFirst = noUpperCased.uppercasedFirst
        XCTAssertEqual(uppercasedFirst, "Hey there")
    }
    
    func testAlreadyUppercasedFirst() {
        let alreadyUppercasedFirst = "Hey there"
        let uppercasedFirst = alreadyUppercasedFirst.uppercasedFirst
        XCTAssertEqual(uppercasedFirst, "Hey there")
    }
}
