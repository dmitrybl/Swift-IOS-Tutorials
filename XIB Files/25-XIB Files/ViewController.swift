//
//  ViewController.swift
//  25-XIB Files
//
//  Created by Dmitry Belyaev on 07.08.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBAction func showDatePicker(_ sender: Any) {
        let datePicker = DatePickerView.initPicker(delegate: self)
        datePicker.showPickerInController(vc: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: DatePickerViewDelegate {
    func pushSelectDate(datePickerView: DatePickerView, date: Date) {
        let df = DateFormatter()
        df.dateStyle = DateFormatter.Style.full
        label.text = df.string(from: date)
    }
    func pushCancel(datePickerView: DatePickerView) {
        
    }
}

