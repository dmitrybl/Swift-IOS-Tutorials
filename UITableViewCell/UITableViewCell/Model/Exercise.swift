//
//  Exercise.swift
//  UITableViewCell
//
//  Created by Dmitry Belyaev on 26.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

var dataArray: [Exercise] {
    return [Exercise(name: "Autumn", image: UIImage(named: "img.jpg")),
            Exercise(name: "Island", image: UIImage(named: "img2.jpg")),
            Exercise(name: "Tree", image: UIImage(named: "img3.jpg"))]
}

class Exercise {
    
    var name: String?
    var image: UIImage?
    
    init(name: String, image: UIImage?) {
        self.name = name
        self.image = image
    }

}
