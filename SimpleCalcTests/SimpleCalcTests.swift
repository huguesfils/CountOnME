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

    func testGivenExpressionInElements_whenTappedEqual_thenExpressionIsNotCorrect() {
        let operators = ["+", "-", "x", "/"]

        for ope in operators {

            calc.addExpression(expr: "4 \(ope)")

            XCTAssertFalse(calc.expressionIsCorrect)
            XCTAssertFalse(calc.expressionHaveEnoughElement)
            XCTAssertFalse(calc.canAddOperator)

            calc.reset()
        }
    }

    func testGivenExpression_whenTappedNumber_thenDidExpressionHaveResult() {
        calc.updateExpression(number: "5")

        XCTAssertFalse(calc.expressionHaveResult)
    }

    func testGivenExpression_whenTappedEqual_thenDidExpressionHaveResult() {
        calc.updateExpression(number: "=")

        XCTAssert(calc.expressionHaveResult)
    }

    func testGivenMultiplicationCalc_whenTappedEqual_thenExpressionIsSimplified() {
        let expr = ["5", "x", "3"] // diviser en 3

        let simplyfied = calc.simplifyMath(expression: expr)

        XCTAssertEqual(simplyfied, ["15"])
    }

    func testGivenExtendMultiplicationCalc_whenTappedEqual_thenExpressionIsSimplified() {
        let expr = ["5", "x", "3", "+", "8"] // diviser en 3

        let simplyfied = calc.simplifyMath(expression: expr)

        XCTAssertEqual(simplyfied, ["15", "+", "8"])
    }

    func testGivenExtendMultAndDivCalc_whenTappedEqual_thenExpressionIsSimplified() {
        let expr = ["5", "x", "3", "+", "8", "/", "2"] // diviser en 3

        let simplyfied = calc.simplifyMath(expression: expr)

        XCTAssertEqual(simplyfied, ["15", "+", "4"])
    }

    func testGivenExpresion_whenTappedEqual_thenCalculation() { //math()
        calc.elements = ["15", "+", "4", "-", "2"]

        let total = calc.math()

        XCTAssertEqual(total, "17")
    }
}
