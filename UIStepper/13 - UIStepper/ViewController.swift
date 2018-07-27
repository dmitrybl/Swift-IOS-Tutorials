//
//  ViewController.swift
//  13 - UIStepper
//
//  Created by Dmitry Belyaev on 25.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepperAction(_ sender: Any) {
        label.text = String(format: "%.f of %.f", stepper.value, stepper.maximumValue)
        progressView.progress = (Float)(stepper.value / stepper.maximumValue)
    }
    
    override func viewDidLoad() {
        stepper.value = 50
        progressView.progress = (Float)(stepper.value / stepper.maximumValue)
        label.text = String(format: "%.f of %.f", stepper.value, stepper.maximumValue)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

