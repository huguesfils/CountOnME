//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTests: XCTestCase {
    var calc: Calculation!

    func testGivenOperationInElements_whenReset_thenElementsIsEmpty() {
        calc.addExpression(expr: "5 x 4")

        calc.reset()

        XCTAssert(calc.elements.isEmpty)
    }


    override func setUp() {
        calc = Calculation()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

//
