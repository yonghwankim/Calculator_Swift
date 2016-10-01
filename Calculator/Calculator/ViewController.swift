//
//  ViewController.swift
//  Calculator
//
//  Created by yonghwankim's macbook on 29/09/2016.
//  Copyright © 2016 yonghwankim's macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        
        userIsInTheMiddleOfTyping = true
        
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
       userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                display.text = String(M_PI)
            }
        }
    }
}
