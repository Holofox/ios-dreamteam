//
//  GroupAddEntryTableViewCell.swift
//  dreamteam
//
//  Created by Holofox on 08.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class GroupAddEntryTableViewCell: BaseTableViewCell {
    static let reuseIdentifier = "GroupAddEntryCell"
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.accessoryType = selected ? .checkmark : .none
    }
}
