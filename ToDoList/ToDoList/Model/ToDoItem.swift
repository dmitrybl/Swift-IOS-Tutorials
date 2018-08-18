//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Dmitry Belyaev on 18.08.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class ToDoItem {
    
    var name: String?
    var isComplete: Bool
    
    var subItems: [ToDoItem]
    
    var subItemsText: String {
        if subItems.count == 0 {
            return ""
        }
        
        var completedToDoCount: Int = 0
        for todo in subItems {
            if todo.isComplete {
                completedToDoCount+=1
            }
        }
        if completedToDoCount == 0 {
            return "\(subItems.count) subitems"
        }
        else {
            return "\(subItems.count) subitems / \(completedToDoCount) complete"
        }
        
    }
    
    var countUncopletedSubTask: Int {
        var uncompletedToDoCount: Int = 0
        for todo in subItems {
            if !todo.isComplete {
                uncompletedToDoCount+=1
            }
        }
        return uncompletedToDoCount
    }
    
    init(name: String) {
        self.name = name
        self.isComplete = false
        
        self.subItems = []
    }
    
    init(dictionary: NSDictionary) {
        self.name = dictionary.object(forKey: "name") as? String
        self.isComplete = dictionary.object(forKey: "isComplete") as! Bool
        self.subItems = []
        
        let arraySubTodos = dictionary.object(forKey: "subtodos") as! NSArray
        for subtodoDict in arraySubTodos {
            self.subItems.append(ToDoItem(dictionary: subtodoDict as! NSDictionary))
        }
    }
    
    var dictionary: NSDictionary {
        var arraySubToDos = NSArray()
        for subItem in subItems {
            arraySubToDos = arraySubToDos.adding(subItem.dictionary) as NSArray
        }
        
        let dictionary = NSDictionary(objects: [name!, isComplete, arraySubToDos], forKeys: ["name" as NSCopying, "isComplete" as NSCopying, "subtodos" as NSCopying])
        return dictionary
    }
    
    func addSubItem(subItem: ToDoItem) {
        subItems.append(subItem)
    }
    
    func removeSubItem(index: Int) {
        subItems.remove(at: index)
    }
    
    func changeState() {
        self.isComplete = !self.isComplete
    }

}
