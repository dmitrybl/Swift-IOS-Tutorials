//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by Dmitry Belyaev on 27/01/2019.
//  Copyright © 2019 Dmitry Belyaev. All rights reserved.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController {

    var article: Article!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var linkButton: UIButton!
    
    @IBAction func pushOpenAction(_ sender: Any) {
        if let url = URL(string: article.url) {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = article.title
        labelDescription.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
        
        if URL(string: article.url) == nil {
            linkButton.isEnabled = false
        }
        
    }

}
