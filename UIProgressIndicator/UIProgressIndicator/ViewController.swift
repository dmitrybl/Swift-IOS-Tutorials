//
//  ViewController.swift
//  UIProgressIndicator
//
//  Created by Dmitry Belyaev on 24.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    var progress: Float = 0
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var actionSpinner: UIActivityIndicatorView!
    @IBOutlet weak var buttonStart: UIButton!
    
    
    @IBAction func buttonStartPush(_ sender: Any) {
        progress = 0
        imageView.image = nil
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.tic), userInfo: nil, repeats: true)
        actionSpinner.startAnimating()
        buttonStart.isHidden = true
        timer.fire()
        
    }
    
    @objc func tic() {
        progress += 0.1
        progressView.progress = progress
        if progress >= 1 {
            actionSpinner.stopAnimating()
            timer.invalidate()
            progressView.progress = 0
            imageView.image = UIImage(named: "img.jpg")
            buttonStart.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        actionSpinner.hidesWhenStopped = true
        actionSpinner.stopAnimating()
        progress = 0
        progressView.progress = progress
        imageView.image = nil
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

