//
//  ViewController.swift
//  22 - NSURLSession
//
//  Created by Dmitry Belyaev on 30.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let url = URL(string: "https://images.pexels.com/photos/36764/marguerite-daisy-beautiful-beauty.jpg?auto=compress&cs=tinysrgb&h=750&w=1260")
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBAction func loadImage(_ sender: Any) {
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = urlSession.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
            }
            else {
                print("Error \(String(describing: error))")
            }
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
            }
        }
        task.resume()
        indicator.startAnimating()
        
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

