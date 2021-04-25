//
//  CalculatorHomeViewModel.swift
//  Calculator
//
//  Created by Gustavo De Sousa on 25/04/21.
//  Copyright © 2021 Gustavo De Sousa. All rights reserved.
//

import Foundation

protocol CalculatorHomeViewModelProtocol {
    func getList() -> [ButtonsCalculatorStruct]
    func getListCount() -> Int
}

final class CalculatorHomeViewModel: CalculatorHomeViewModelProtocol {
    private let buttonsCalculator = [
        ButtonsCalculatorStruct(textButton: "CE", colorButton: .lightGray),
        ButtonsCalculatorStruct(textButton: "C", colorButton: .lightGray),
        ButtonsCalculatorStruct(textButton: "%", colorButton: .lightGray),
        ButtonsCalculatorStruct(textButton: "Del", colorButton: .purple),
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
        ButtonsCalculatorStruct(textButton: ",", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "0", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "÷", colorButton: .darkGray),
        ButtonsCalculatorStruct(textButton: "=", colorButton: .purple)
    ]
    
    func getList() -> [ButtonsCalculatorStruct] {
        return buttonsCalculator
    }
    
    func getListCount() -> Int {
        return buttonsCalculator.count
    }
}
