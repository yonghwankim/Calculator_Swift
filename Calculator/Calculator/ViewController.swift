//
//  ViewController.swift
//  Calculator
//
//  Created by yonghwankim's macbook on 29/09/2016.
//  Copyright © 2016 yonghwankim's macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()

    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
        }
        userIsInTheMiddleOfTyping = false
        if let mathemeticalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathemeticalSymbol)
        }
        displayValue = brain.result

    }
}
