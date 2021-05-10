//
//  CalculatorHomeViewModel.swift
//  Calculator
//
//  Created by Gustavo De Sousa on 25/04/21.
//  Copyright © 2021 Gustavo De Sousa. All rights reserved.
//

import Foundation

enum TYPES_CALCULATOR: String {
    case sum = "+"
    case mult = "x"
    case sub = "-"
    case div = "÷"
    case perc = "%"
    case equal = "="
    case deleteChar = "C"
    case deleteAll = "CE"
}

protocol CalculatorHomeViewModelProtocol {
    func getList() -> [ButtonsCalculatorStruct]
    func getListCount() -> Int
    func insertValueCalculator(inputCalculator: String)
    func getInfoCalculator() -> [String]
    func getValueResult() -> Double
}

final class CalculatorHomeViewModel: CalculatorHomeViewModelProtocol {
    
    // MARK: - Variable and Constants
    private let buttonsCalculator = [
        ButtonsCalculatorStruct(textButton: "CE", colorButton: .lightGray),
        ButtonsCalculatorStruct(textButton: "C", colorButton: .lightGray),
        ButtonsCalculatorStruct(textButton: "%", colorButton: .lightGray),
        ButtonsCalculatorStruct(textButton: "÷", colorButton: .purple),
        ButtonsCalculatorStruct(textButton: "7", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "8", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "9", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "x", colorButton: .purple),
        ButtonsCalculatorStruct(textButton: "4", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "5", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "6", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "-", colorButton: .purple),
        ButtonsCalculatorStruct(textButton: "1", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "2", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "3", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "+", colorButton: .purple),
        ButtonsCalculatorStruct(textButton: "+/-", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "0", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: ",", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "=", colorButton: .purple)
    ]
    
    var inputNumbers: [String] = []
    private var result: Double = 0
    
    // MARK: - Functions
    func getList() -> [ButtonsCalculatorStruct] {
        return buttonsCalculator
    }
    
    func getListCount() -> Int {
        return buttonsCalculator.count
    }
    
    func insertValueCalculator(inputCalculator: String) {
        if inputNumbers.isEmpty {
            if !isSignalChar(inputCalculator) && isNumber(inputCalculator) {
                inputNumbers.append(inputCalculator)
            }
        } else {
            guard let lastInput = inputNumbers.last else { return }
            
            if inputCalculator == TYPES_CALCULATOR.deleteChar.rawValue {
                inputNumbers.removeLast()
            } else if inputCalculator == TYPES_CALCULATOR.deleteAll.rawValue {
                inputNumbers.removeAll()
            } else if isSignalChar(inputCalculator) {
                if !isSignalChar(inputNumbers.last ?? "+") {
                    if inputCalculator == TYPES_CALCULATOR.equal.rawValue {
                        getResult()
                    } else {
                        inputNumbers.append(inputCalculator)
                    }
                } else if isSignalChar(inputNumbers.last ?? "") {
                    inputNumbers.removeLast()
                    getResult()
                }
            } else if isNumber(lastInput) {
                if !lastInput.contains(",") {
                    let newNumber = lastInput + inputCalculator
                    inputNumbers.removeLast()
                    inputNumbers.append(newNumber)
                } else {
                    if inputCalculator != ","  {
                        let newNumber = lastInput + inputCalculator
                        inputNumbers.removeLast()
                        inputNumbers.append(newNumber)
                    } else {
                        return
                    }
                }
            } else if isNumber(inputCalculator) {
                inputNumbers.append(inputCalculator)
            }
        }
        
        if inputCalculator != TYPES_CALCULATOR.equal.rawValue {
            NotificationCenter.default.post(name: .updateInfo, object: inputNumbers)
        }
    }
    
    private func getResult() {
        var signal = ""
        
        cleanResult()
        inputNumbers.forEach { (value) in
            if isNumber(value) {
                if result == 0 {
                    guard let updateResult = Double(value.replacingOccurrences(of: ",", with: ".")) else { return }
                    result = updateResult
                } else {
                    guard let valueCalculate = Double(value.replacingOccurrences(of: ",", with: ".")) else { return }
                    calculate(signal, nextValue: valueCalculate)
                }
            } else if isSignalChar(value) {
                signal = value
            }
        }
    }
    
    private func calculate(_ signal: String, nextValue: Double) {
        switch signal {
        case TYPES_CALCULATOR.sum.rawValue:
            result += nextValue
        case TYPES_CALCULATOR.sub.rawValue:
            result -= nextValue
        case TYPES_CALCULATOR.div.rawValue:
            result = result / nextValue
        case TYPES_CALCULATOR.mult.rawValue:
            result = result * nextValue
        default:
            break
        }
        inputNumbers.removeAll()
        inputNumbers.append(String(result))
        NotificationCenter.default.post(name: .showResult, object: result)
    }
    
    private func cleanResult() {
        result = 0
    }
    
    func getInfoCalculator() -> [String] {
        return inputNumbers
    }
    
    func getValueResult() -> Double {
        return result
    }
    
    private func isSignalChar(_ inputCalculator: String) -> Bool {
        if inputCalculator == TYPES_CALCULATOR.sum.rawValue ||
            inputCalculator == TYPES_CALCULATOR.sub.rawValue ||
            inputCalculator == TYPES_CALCULATOR.mult.rawValue ||
            inputCalculator == TYPES_CALCULATOR.perc.rawValue ||
            inputCalculator == TYPES_CALCULATOR.equal.rawValue ||
            inputCalculator == TYPES_CALCULATOR.div.rawValue {
            return true
        } else {
            return false
        }
    }
    
    private func isNumber(_ input: String) -> Bool {
        if input.contains("1") ||
            input.contains("2") ||
            input.contains("3") ||
            input.contains("4") ||
            input.contains("5") ||
            input.contains("6") ||
            input.contains("7") ||
            input.contains("8") ||
            input.contains("9") ||
            input.contains("0") {
            return true
        } else {
            return false
        }
    }
}
