//
//  Model.swift
//  ToDoList
//
//  Created by Dmitry Belyaev on 18.08.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

var pathForSaveData: String {
    let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/data.plist"
    return path;
}

var rootItem: ToDoItem?
    
func loadData() {
    if let dict = NSDictionary(contentsOfFile: pathForSaveData) {
        rootItem = ToDoItem(dictionary: dict)
    }
    else {
        rootItem = ToDoItem(name: "ToDo")
    }
}
    
func saveData() {
    rootItem?.dictionary.write(toFile: pathForSaveData, atomically: true)
    if enabledBadges {
        UIApplication.shared.applicationIconBadgeNumber = (rootItem?.countUncopletedSubTask)!
    } else {
         UIApplication.shared.applicationIconBadgeNumber = 0
    }
  
}

var enabledBadges: Bool {
    set {
        UserDefaults.standard.set(newValue, forKey: "enableBadges")
        UserDefaults.standard.synchronize()
    }
    get {
        return UserDefaults.standard.bool(forKey: "enableBadges")
    }
}

