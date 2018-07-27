//
//  NewViewController.swift
//  14 - UITableView
//
//  Created by Dmitry Belyaev on 25.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBAction func pushBackNav(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pushBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var textData: String?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = textData

        // Do any additional setup after loading the view.
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
