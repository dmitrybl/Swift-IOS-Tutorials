//
//  ViewController.swift
//  19 - SendingMail
//
//  Created by Dmitry Belyaev on 27.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    var mailController = MFMailComposeViewController()
    
    @IBAction func pushSendMessageEmail(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail() {
            print("Can't send mail")
            return
        }
        mailController.setToRecipients(["dmitry.bl.5967@gmail.com"])
        mailController.setSubject("Hello from IOS")
        mailController.setMessageBody("Hello!", isHTML: false)
        
        mailController.mailComposeDelegate = self
        
        present(mailController, animated: true, completion: nil)
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

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("cancelled")
            break
        case .saved:
            print("saved")
            break
        case .sent:
            print("sent")
            break
        default:
            print("failed")
        }
        
        mailController.dismiss(animated: true, completion: nil)
    }

}

