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

    private var sut: CalculatorHomeViewModel!
    
    override func setUp() {
        sut = CalculatorHomeViewModel()
    }
    
    // MARK: - Method sum success and error
    func testeInsertInfoCalculator_WhenSumValues_ShouldGetSuccessValues() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "+")
        sut.insertInfoCalculator(inputCalculator: "20")
        sut.insertInfoCalculator(inputCalculator: "=")
        
        XCTAssertEqual(sut.result, 30)
    }
    
    func testeInsertInfoCalculator_WhenSumValues_ShouldGetFailValues() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "+")
        sut.insertInfoCalculator(inputCalculator: "20")
        sut.insertInfoCalculator(inputCalculator: "=")
        
        XCTAssertFalse(sut.result == 29, "A soma não esta batendo conforme o esperado")
    }
    
    // MARK: - Method subtract success and error
    func testeInsertInfoCalculator_WhenSubtractValues_ShouldGetSuccessValues() {
        sut.insertInfoCalculator(inputCalculator: "20")
        sut.insertInfoCalculator(inputCalculator: "-")
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "=")
        
        XCTAssertEqual(sut.result, 10)
    }
    
    func testeInsertInfoCalculator_WhenSubtractValues_ShouldGetFailValues() {
        sut.insertInfoCalculator(inputCalculator: "20")
        sut.insertInfoCalculator(inputCalculator: "-")
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "=")
        
        XCTAssertFalse(sut.result == 19, "A subtração não esta batendo conforme o esperado")
    }

    // MARK: - Method multiplication success and error
    func testeInsertInfoCalculator_WhenMultiplicationValues_ShouldGetSuccessValues() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "x")
        sut.insertInfoCalculator(inputCalculator: "20")
        sut.insertInfoCalculator(inputCalculator: "=")
        
        XCTAssertEqual(sut.result, 200)
    }
    
    func testeInsertInfoCalculator_WhenMultiplicationValues_ShouldGetErrorValues() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "x")
        sut.insertInfoCalculator(inputCalculator: "20")
        sut.insertInfoCalculator(inputCalculator: "=")

        XCTAssertFalse(sut.result == 199, "A subtração não esta batendo conforme o esperado")
    }
    
    // MARK: - Method insert dot success and error
    func testeInsertInfoCalculator_WhenAddDotInValue_ShouldAddDotInValueWithSuccess() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: ",")
        sut.insertInfoCalculator(inputCalculator: "99")
        
        XCTAssertEqual(sut.getInfoCalculator().first, "10,99")
    }
    
    func testeInsertInfoCalculator_WhenAddDotInValue_ShouldAddDotInValueWithError() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: ",")
        sut.insertInfoCalculator(inputCalculator: ",")
        sut.insertInfoCalculator(inputCalculator: "99")

        XCTAssertFalse(sut.getInfoCalculator().first == "10,,99", "Virgula inserida errada")
    }
    
    // MARK: - Method remove value success and error
    func testeInsertInfoCalculator_WhenRemoveValue_ShouldARemoveValueWithSuccess() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "+")
        sut.insertInfoCalculator(inputCalculator: "C")
        
        XCTAssertEqual(sut.getInfoCalculator().last, "10")
    }
    
    func testeInsertInfoCalculator_WhenRemoveValue_ShouldARemoveValueWithError() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "+")
        sut.insertInfoCalculator(inputCalculator: "C")
        
        XCTAssertFalse(sut.getInfoCalculator().last == "+", "Valor nao removido")
    }
    
    // MARK: - Method remove all value success and error
    func testeInsertInfoCalculator_WhenRemoveAllValue_ShouldARemoveAllValueWithSuccess() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "+")
        sut.insertInfoCalculator(inputCalculator: "CE")
        
        XCTAssertEqual(sut.getInfoCalculator(), [])
    }
    
    func testeInsertInfoCalculator_WhenRemoveAllValue_ShouldARemoveAllValueWithError() {
        sut.insertInfoCalculator(inputCalculator: "10")
        sut.insertInfoCalculator(inputCalculator: "+")
        sut.insertInfoCalculator(inputCalculator: "CE")
        
        XCTAssertFalse(sut.getInfoCalculator().count >= 1, "A lista nao foi limpa")
    }

}
