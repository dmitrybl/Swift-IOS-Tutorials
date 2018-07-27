//
//  TableTableViewController.swift
//  14 - UITableView
//
//  Created by Dmitry Belyaev on 25.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dataArray: [String] = []
    
    @IBAction func pushEditAction(_ sender: UIBarButtonItem) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    func saveData() {
        UserDefaults.standard.set(dataArray, forKey: "dataArray")
        UserDefaults.standard.synchronize()
    }
    
    func loadData() {
        let data = UserDefaults.standard.object(forKey: "dataArray")
        if (data != nil) {
            dataArray = data as! [String]
        }
        else {
            dataArray = []
        }
    }
    
    @IBAction func pushAddAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Добавьте транспорт", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Название транспорта"
        }
        let alertActionAdd = UIAlertAction(title: "Добавить", style: UIAlertActionStyle.default) { (alertAction) in
            if alert.textFields?.first?.text != "" {
                self.dataArray.append((alert.textFields?.first?.text)!)
                self.saveData()
                self.tableView.reloadData()
            }
        }
        let alertActionCancel = UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel) { (alertAction) in }
        
        alert.addAction(alertActionAdd)
        alert.addAction(alertActionCancel)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        loadData()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentTextInCell = dataArray[indexPath.row]
        cell.textLabel?.text = currentTextInCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveData()
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let from = dataArray[sourceIndexPath.row]
        dataArray.remove(at: sourceIndexPath.row)
        dataArray.insert(from, at: destinationIndexPath.row)
        saveData()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    var selectedData: String?
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData = dataArray[indexPath.row]
        self.performSegue(withIdentifier: "goToViewControllerSegueID", sender: self)
        
        //let vc = (storyboard?.instantiateViewController(withIdentifier: "newViewControllerSI") as! NewViewController)
        //vc.textData = dataArray[indexPath.row]
        //navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //let selectedData = dataArray[(tableView.indexPathForSelectedRow?.row)!]
        if (segue.identifier == "goToViewControllerSegueID") {
            (segue.destination as! NewViewController).textData = selectedData
        }
    }
    
    
}
