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

    override func setUp() {
        calc = Calculation()
    }

    func testGivenOperationInElements_whenReset_thenElementsIsEmpty() {
        calc.addExpression(expr: "5 x 4")

        calc.reset()

        XCTAssert(calc.elements.isEmpty)
    }

    func testGivenDivisionInElements_whenDivideZero_thenElementsContainsZero() {
        calc.addExpression(expr: "3 / 0")

        XCTAssert(calc.divideZero == true)
    }

    func testGivenExpressionInElements_whenTappedEqual_thenExpressionIsCorrect() {
        calc.addExpression(expr: "4 + 3")

        XCTAssert(calc.expressionIsCorrect)
        XCTAssert(calc.expressionHaveEnoughElement)
        XCTAssert(calc.canAddOperator)
    }
}
