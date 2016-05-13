//
//  TaskCell.swift
//  TableXIB
//
//  Created by mruiz723 on 5/12/16.
//  Copyright © 2016 nextU. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
