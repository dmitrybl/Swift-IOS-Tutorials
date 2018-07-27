//
//  TableViewCell.swift
//  UITableViewCell
//
//  Created by Dmitry Belyaev on 26.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var exercise: Exercise?
    
    func initCell(exercise: Exercise) {
        self.exercise = exercise
        
        imgView.image = exercise.image
        label.text = exercise.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
