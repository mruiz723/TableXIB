//
//  TasksTableViewController.swift
//  TableXIB
//
//  Created by mruiz723 on 5/12/16.
//  Copyright © 2016 nextU. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    //MARK: - Properties
    let userDefaults = NSUserDefaults.standardUserDefaults()
    var data:[Task]?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        data = retrieveTask()
        
        // Add button item
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addTask))
        self.navigationItem.rightBarButtonItem = addButtonItem
        
        self.title = "Task"
        
        //Registe nib TableViewCell
        tableView.registerNib(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
        return (data?.count)!
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath) as! TaskCell
        let task = data![indexPath.row]
        // Configure the cell...
        cell.nameLabel.text = task.name
        cell.priorityLabel.text = task.priority
        return cell
    }
    
     // MARK: - Utils
    
    func addTask(){
        
        let alert = UIAlertController(title: "New Task", message: "", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (task) in
            task.placeholder = "Ingrese una tarea"
        }
        
        alert.addTextFieldWithConfigurationHandler { (priority) in
            priority.placeholder = "Ingrese la prioridad"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (saveAction) in
            
            let name = alert.textFields?.first
            let priority = alert.textFields?.last
            
            let task = Task(name: (name?.text)!, priority: (priority?.text)!)
            self.data?.append(task)
            
            self.saveTask(self.data!)
            
            self.tableView.reloadData()
        }
        
        alert.addAction(saveAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveTask(task:[Task]){
        let archivedObject = NSKeyedArchiver.archivedDataWithRootObject(task as NSArray)
        userDefaults.setObject(archivedObject, forKey: "Task")
    }

    func retrieveTask() -> [Task]? {
        if let unarchivedObject = userDefaults.objectForKey("Task") as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(unarchivedObject) as? [Task]
        }
        return [Task]()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
}
