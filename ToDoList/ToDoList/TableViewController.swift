//
//  TableViewController.swift
//  ToDoList
//
//  Created by Dmitry Belyaev on 18.08.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var toDoItemCurrent: ToDoItem?
    
    @IBAction func pushAddAction(_ sender: Any) {
        let alert = UIAlertController(title: "Create new item", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (textField) in
            textField.placeholder = "ToDo item"
        }
        let alertActionCreate = UIAlertAction(title: "Create", style: UIAlertActionStyle.default) { (alertAction) in
            if alert.textFields![0].text != "" {
                let newItem = ToDoItem(name: alert.textFields![0].text!)
                self.toDoItemCurrent?.addSubItem(subItem: newItem)
                self.tableView.reloadData()
                saveData()
            }
        }
        
        let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (alert) in
        }
        
        alert.addAction(alertActionCreate)
        alert.addAction(alertActionCancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDoItemCurrent == nil {
            toDoItemCurrent = rootItem
            navigationItem.leftBarButtonItem = buttonSettings
        }
        else {
            navigationItem.leftBarButtonItem = nil
        }
        
        navigationItem.title = toDoItemCurrent?.name
        
        let longPressGestureRecognizer =
            UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressGestureRecognizer.minimumPressDuration = 1
        tableView.addGestureRecognizer(longPressGestureRecognizer)
        
        
    }
    
    @objc func handleLongPress(longPress: UILongPressGestureRecognizer) {
        let pointOfTouch = longPress.location(in: tableView)
        let indexPath = tableView.indexPathForRow(at: pointOfTouch)
        
        if longPress.state == .began {
            if let indexPath = indexPath {
                let toDoItem = toDoItemCurrent?.subItems[indexPath.row]
                
                let alert = UIAlertController(title: "Edit item", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alert.addTextField { (textField) in
                    textField.placeholder = "ToDo item"
                    textField.text = toDoItem?.name
                }
                let alertActionCreate = UIAlertAction(title: "Update", style: UIAlertActionStyle.default) { (alertAction) in
                    if alert.textFields![0].text != "" {
                        toDoItem?.name = alert.textFields![0].text
                        self.tableView.reloadData()
                        saveData()
                    }
                }
                
                let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (alert) in
                }
                
                alert.addAction(alertActionCreate)
                alert.addAction(alertActionCancel)
                present(alert, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (toDoItemCurrent?.subItems.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        let itemForCell = toDoItemCurrent?.subItems[indexPath.row]
        cell.initCell(toDo: itemForCell!)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoItemCurrent?.removeSubItem(index: indexPath.row)
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subItem = toDoItemCurrent?.subItems[indexPath.row]
        let tvc = storyboard?.instantiateViewController(withIdentifier: "todoSID") as! TableViewController
        tvc.toDoItemCurrent = subItem
        navigationController?.pushViewController(tvc, animated: true)
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func buttonActionSettings(_ sender: Any) {
        let nvc = storyboard?.instantiateViewController(withIdentifier: "SettingsNCSBID")
        present(nvc!, animated: true, completion: nil)
    }
    @IBOutlet weak var buttonSettings: UIBarButtonItem!
    

}
