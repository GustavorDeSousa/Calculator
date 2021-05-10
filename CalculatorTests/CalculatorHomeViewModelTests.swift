//
//  CalculatorHomeViewModelTests.swift
//  CalculatorTests
//
//  Created by Gustavo De Sousa on 02/05/21.
//  Copyright © 2021 Gustavo De Sousa. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorHomeViewModelTests: XCTestCase {

    // MARK: - variable and Constants
    private var sut: CalculatorHomeViewModelProtocol!
    
    // MARK: - setUp and tearDown
    override func setUpWithError() throws {
        sut = CalculatorHomeViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Method sum success and error
    func testeInsertInfoCalculatorSumValues() {
        // given
        let firstValue = "10"
        let secondValue = "+"
        let thirdValue = "20"
        let equalValue = "="
        
        // when
        sut.insertValueCalculator(inputCalculator: firstValue)
        sut.insertValueCalculator(inputCalculator: secondValue)
        sut.insertValueCalculator(inputCalculator: thirdValue)
        sut.insertValueCalculator(inputCalculator: equalValue)
        
        // then
        XCTAssertEqual(sut.getValueResult(), 30.0)
    }
    
    func testeInsertInfoCalculator_WhenSumValues_ShouldGetFailValues() {
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: "+")
        sut.insertValueCalculator(inputCalculator: "20")
        sut.insertValueCalculator(inputCalculator: "=")
        
        XCTAssertFalse(sut.getValueResult() == 29.0, "A soma não esta batendo conforme o esperado")
    }
    
    // MARK: - Method subtract success and error
    func testeInsertInfoCalculator_WhenSubtractValues_ShouldGetSuccessValues() {
        sut.insertValueCalculator(inputCalculator: "20")
        sut.insertValueCalculator(inputCalculator: "-")
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: "=")
        
        XCTAssertEqual(sut.getValueResult(), 10.0)
    }
    
    func testeInsertInfoCalculator_WhenSubtractValues_ShouldGetFailValues() {
        sut.insertValueCalculator(inputCalculator: "20")
        sut.insertValueCalculator(inputCalculator: "-")
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: "=")
        
        XCTAssertFalse(sut.getValueResult() == 19.0, "A subtração não esta batendo conforme o esperado")
    }

    // MARK: - Method multiplication success and error
    func testeInsertInfoCalculator_WhenMultiplicationValues_ShouldGetSuccessValues() {
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: "x")
        sut.insertValueCalculator(inputCalculator: "20")
        sut.insertValueCalculator(inputCalculator: "=")
        
        XCTAssertEqual(sut.getValueResult(), 200.0)
    }
    
    func testeInsertInfoCalculator_WhenMultiplicationValues_ShouldGetErrorValues() {
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: "x")
        sut.insertValueCalculator(inputCalculator: "20")
        sut.insertValueCalculator(inputCalculator: "=")

        XCTAssertFalse(sut.getValueResult() == 199.0, "A subtração não esta batendo conforme o esperado")
    }
    
    // MARK: - Method insert dot success and error
    func testeInsertInfoCalculator_WhenAddDotInValue_ShouldAddDotInValueWithSuccess() {
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: ",")
        sut.insertValueCalculator(inputCalculator: "99")
        
        XCTAssertEqual(sut.getInfoCalculator().first, "10,99")
    }
    
    func testeInsertInfoCalculator_WhenAddDotInValue_ShouldAddDotInValueWithError() {
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: ",")
        sut.insertValueCalculator(inputCalculator: ",")
        sut.insertValueCalculator(inputCalculator: "99")

        XCTAssertFalse(sut.getInfoCalculator().first == "10,,99", "Virgula inserida errada")
    }
    
    // MARK: - Method remove value success and error
    func testeInsertInfoCalculator_WhenRemoveValue_ShouldARemoveValueWithSuccess() {
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: "+")
        sut.insertValueCalculator(inputCalculator: "C")
        
        XCTAssertEqual(sut.getInfoCalculator().last, "10")
    }
    
    func testeInsertInfoCalculator_WhenRemoveValue_ShouldARemoveValueWithError() {
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: "+")
        sut.insertValueCalculator(inputCalculator: "C")
        
        XCTAssertFalse(sut.getInfoCalculator().last == "+", "Valor nao removido")
    }
    
    // MARK: - Method remove all value success and error
    func testeInsertInfoCalculator_WhenRemoveAllValue_ShouldARemoveAllValueWithSuccess() {
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: "+")
        sut.insertValueCalculator(inputCalculator: "CE")
        
        XCTAssertEqual(sut.getInfoCalculator(), [])
    }
    
    func testeInsertInfoCalculator_WhenRemoveAllValue_ShouldARemoveAllValueWithError() {
        sut.insertValueCalculator(inputCalculator: "10")
        sut.insertValueCalculator(inputCalculator: "+")
        sut.insertValueCalculator(inputCalculator: "CE")
        
        XCTAssertFalse(sut.getInfoCalculator().count >= 1, "A lista nao foi limpa")
    }

}
