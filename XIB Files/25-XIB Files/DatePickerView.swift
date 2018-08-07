//
//  DatePickerView.swift
//  25-XIB Files
//
//  Created by Dmitry Belyaev on 07.08.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class DatePickerView: UIView {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    var delegate: DatePickerViewDelegate?
    
    class func initPicker(delegate: DatePickerViewDelegate) -> DatePickerView {
        let datePicker = Bundle.main.loadNibNamed("DatePicker", owner: self, options: nil)![0] as! DatePickerView
        datePicker.delegate = delegate
        return datePicker
    }
    
    func showPickerInController(vc: UIViewController) {
        vc.view.addSubview(self)
        self.frame.size.width = vc.view.frame.size.width
        self.frame.origin.x = 0
        self.frame.origin.y = vc.view.frame.size.height
        
        UIView.animate(withDuration: 0.5, animations: { self.frame.origin.y =
            vc.view.frame.size.height  - self.frame.size.height })
    }

    @IBAction func pushSelectAction(_ sender: Any) {
        delegate?.pushSelectDate(datePickerView: self, date: datePicker.date)
        
        self.frame.origin.y = (self.delegate as! UIViewController).view.frame.size.height  - self.frame.size.height
        
        UIView.animate(withDuration: 0.5, animations: { self.frame.origin.y =
            (self.delegate as! UIViewController).view.frame.size.height }) {
              (Bool) in
            self.removeFromSuperview()
        }
        
    }
    
    @IBAction func pushCancelAction(_ sender: Any) {
        delegate?.pushCancel(datePickerView: self)
        
        self.frame.origin.y = (self.delegate as! UIViewController).view.frame.size.height  - self.frame.size.height
        
        UIView.animate(withDuration: 0.5, animations: { self.frame.origin.y =
            (self.delegate as! UIViewController).view.frame.size.height }) {
                (Bool) in
                self.removeFromSuperview()
        }
    }
}


protocol DatePickerViewDelegate {
    func pushSelectDate(datePickerView: DatePickerView, date: Date)
    func pushCancel(datePickerView: DatePickerView)
}
