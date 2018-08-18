//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Dmitry Belyaev on 18.08.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var buttonCheck: UIButton!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSubItems: UILabel!
    
    
    @IBAction func pushCheckAction(_ sender: Any) {
        todoInCell?.changeState()
        setCheckButton()
        saveData()
    }
    
    var todoInCell: ToDoItem?
    func initCell(toDo: ToDoItem) {
        todoInCell = toDo
        labelName.text = todoInCell?.name
        labelSubItems.text = todoInCell?.subItemsText
        
        setCheckButton()
        saveData()
    }
    
    func setCheckButton() {
        if (todoInCell?.isComplete)! {
            buttonCheck.setImage(UIImage(named: "check.png"), for: .normal)
        }
        else {
            buttonCheck.setImage(UIImage(named: "uncheck.png"), for: .normal)
        }
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
