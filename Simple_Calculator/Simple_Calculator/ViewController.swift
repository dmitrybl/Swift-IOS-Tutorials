//
//  ViewController.swift
//  Simple_Calculator
//
//  Created by Dmitry Belyaev on 19.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var x:Double = 0 // текущий набор цифр
    var y:Double! // промежуточное значение набора
    
    var operation:NSInteger = 0
    
    var enterFlag:Bool = false
    var yFlag = false
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBAction func clearAll() {
        x = 0
        y = 0
        enterFlag = false
        yFlag = false
        printInScreen()
    }
    
    
    @IBAction func clear(_ sender: Any) {
        x = 0
        printInScreen()
    }
    
    @IBAction func digit(_ sender: AnyObject) {
        
        if enterFlag == true {
            y = x
            x = 0
            enterFlag = false
        }
 
        x = (x * 10) + Double(sender.tag)
        printInScreen()
    }
    
    @IBAction func inverse() {
        
    }
    
    @IBAction func operation(_ sender: AnyObject) {
        
        if yFlag == false {
    
            if(operation == 1001) {
                x = y + x
            }
            if(operation == 1002) {
                x = y - x
            }
            if(operation == 1003) {
                x = y * x
            }
            if(operation == 1004) {
                x = y / x
            }
            
        }
        
        y = x
    
        enterFlag = true
        operation = sender.tag
        printInScreen()
    }
    
    func printInScreen() {
        let str:String = String.init(format: "%g", x)
        displayLabel.text = str
    }
    
}

