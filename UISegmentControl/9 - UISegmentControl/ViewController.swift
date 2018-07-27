//
//  ViewController.swift
//  9 - UISegmentControl
//
//  Created by Dmitry Belyaev on 23.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func chooseImage(_ sender: Any) {
        let selectedIndex: Int = (sender as! UISegmentedControl).selectedSegmentIndex
        var currentImage: UIImage?
        if(selectedIndex == 0) {
            currentImage = UIImage(named: "img.jpg")
        }
        else {
            currentImage = UIImage(named: "img2.jpg")
        }
        imageView.image = currentImage
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "img2.jpg")
        segmentControl.selectedSegmentIndex = 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

