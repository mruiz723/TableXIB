//
//  Task.swift
//  TableXIB
//
//  Created by mruiz723 on 5/12/16.
//  Copyright © 2016 nextU. All rights reserved.
//

import UIKit

class Task: NSObject, NSCoding {
    
    //MARK: - Properties
    var name:String?
    var priority:String?
    
    
    //MARK: - NSCoding
    required init(coder aDecoder:NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as? String
        priority = aDecoder.decodeObjectForKey("priority") as? String
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(priority, forKey: "priority")
    }
    
    //MARK: - Init
    init(name:String, priority:String) {
        self.name = name
        self.priority = priority
    }
    
    
    convenience override init() {
        self.init(name: "", priority: "")
    }

}
