//
//  ViewController.swift
//  4 - UIImage
//
//  Created by Dmitry Belyaev on 24.04.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imagesArray: [UIImage]? = nil
    var counter = 0
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func changeImage(_ sender: Any) {
        counter+=1
        if counter >= (imagesArray?.count)! {
            counter = 0
        }
        imageView.image = imagesArray?[counter]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let image0 = UIImage(named: "images/img0.png")
        let image2 = UIImage(named: "images/img2.png")
        imagesArray = [image0!, image2!]
        imageView.image = imagesArray?[counter]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

