//
//  ViewController.swift
//  8 - UISlider
//
//  Created by Dmitry Belyaev on 23.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func sliderMove(_ sender: Any) {
        imageView.alpha = CGFloat(slider.value)
        label.text = String(format: "%f", slider.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let img: UIImage = UIImage(named: "img.jpg")!
        imageView.image = img
        let str: String = "0.4"
        label.text = str
        slider.value = 0.4
        imageView.alpha = CGFloat(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

