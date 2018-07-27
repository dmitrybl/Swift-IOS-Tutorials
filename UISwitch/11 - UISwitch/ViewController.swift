//
//  ViewController.swift
//  11 - UISwitch
//
//  Created by Dmitry Belyaev on 24.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var info: UILabel!
    
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    
    @IBAction func `switch`(_ sender: UISwitch) {
        info.text = setDecision(sw1: switch1.isOn, sw2: switch2.isOn)
        setState(sw1: switch1.isOn, sw2: switch2.isOn)
    }
    
    func setDecision(sw1: Bool, sw2: Bool) -> String {
        var str: String = ""
        if(!sw1 && !sw2) {
            return "none"
        }
        if(sw1) {
            str += "switch1 "
        }
        if(sw2) {
            str += "switch2 "
        }
        return str
    }
    
    func setState(sw1: Bool, sw2: Bool) {
        UserDefaults.standard.set(sw1, forKey: "switch1")
        UserDefaults.standard.set(sw2, forKey: "switch2")
        UserDefaults.standard.synchronize()
    }
    
    func getState() -> (sw1: Bool, sw2: Bool) {
        return (UserDefaults.standard.bool(forKey: "switch1"),
        UserDefaults.standard.bool(forKey: "switch2"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        info.text = setDecision(sw1: switch1.isOn, sw2: switch2.isOn)
        switch1.isOn = getState().sw1
        switch2.isOn = getState().sw2
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

