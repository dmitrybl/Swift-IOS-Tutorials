//
//  TableViewController.swift
//  21 - FileManager
//
//  Created by Dmitry Belyaev on 28.07.2018.
//  Copyright © 2018 Dmitry Belyaev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var currentDirectory: String?
    var content: [String] = []
    
    @IBAction func pushAddFile(_ sender: Any) {
        let pathToFile = currentDirectory! + "/" + String(content.count) + ".plist"
        NSArray(array: ["1", "2", "3"]).write(toFile: pathToFile, atomically: true)
        refreshData(needsReload: true)
    }
    
    @IBAction func pushAddDirectory(_ sender: Any) {
        let pathToFolder = currentDirectory! + "/" + String(content.count)
        try? FileManager.default.createDirectory(atPath: pathToFolder, withIntermediateDirectories: false, attributes: nil)
        refreshData(needsReload: true)
    }
    
    func refreshData(needsReload: Bool) {
        if currentDirectory == nil {
            currentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        }
        
        content = try! FileManager.default.contentsOfDirectory(atPath: currentDirectory!)
        if(needsReload) {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData(needsReload: true)
        print(currentDirectory!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return content.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = content[indexPath.row]
        
        let fullPath: String = currentDirectory! + "/" + content[indexPath.row]
        
        if checkDirectory(path: fullPath) {
            cell.detailTextLabel?.text = "Folder"
        }
        else {
            cell.detailTextLabel?.text = "File"
        }
        return cell
    }
    
    func checkDirectory(path: String) -> Bool {
        var isDirectory: ObjCBool = false
        FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        return isDirectory.boolValue
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fullPath = currentDirectory! + "/" + content[indexPath.row]
        
        if(checkDirectory(path: fullPath)) {
            let tvc = storyboard?.instantiateViewController(withIdentifier: "tableViewSID") as! TableViewController
            tvc.currentDirectory = fullPath
            navigationController?.pushViewController(tvc, animated: true)
        }
        else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TextViewSID") as! ViewController
            vc.pathToFile = fullPath
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let fullPath = currentDirectory! + "/" + content[indexPath.row]
            try? FileManager.default.removeItem(atPath: fullPath)
            refreshData(needsReload: false)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }  
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

}
