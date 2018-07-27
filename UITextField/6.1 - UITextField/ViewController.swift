//
//  ViewController.swift
//  6.1 - UITextField
//
//  Created by Dmitry Belyaev on 25.04.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func showName(_ sender: Any) {
        if textField.text == "" {
            return
        }
        label.text = "Hello, " + textField.text!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        button.isHidden = true
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        button.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        button.isHidden = false
    }

}

