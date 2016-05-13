//
//  ViewController.swift
//  TableXIB
//
//  Created by mruiz723 on 5/12/16.
//  Copyright © 2016 nextU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBActions
    @IBAction func loadTask(sender: AnyObject) {
        
        let taskController = TasksTableViewController()
        self.navigationController?.pushViewController(taskController, animated: true)
    }
    
    //MARK: - LifeCylce
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

