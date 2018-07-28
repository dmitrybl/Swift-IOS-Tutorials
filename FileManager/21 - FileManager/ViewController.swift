//
//  ViewController.swift
//  21 - FileManager
//
//  Created by Dmitry Belyaev on 28.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pathToFile: String?
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = try? String(contentsOfFile: pathToFile!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
