//
//  ViewController.swift
//  Calculator
//
//  Created by Lo on 04/23/2019.
//  Copyright © 2019 Lo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError() }
            return number
        } set {
            displayLabel.text = String(newValue)
        }
    }

    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {  
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            guard let results = calculator.calculate(symbol: calcMethod) else {return}
            displayValue = results
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numberValue = sender.currentTitle {
            if isFinishedTypingNumber{
                displayLabel.text = numberValue
                isFinishedTypingNumber = false
            } else {
                
                if numberValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
    }
}
