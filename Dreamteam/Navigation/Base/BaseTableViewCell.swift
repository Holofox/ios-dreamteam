//
//  BaseTableViewCell.swift
//  dreamteam
//
//  Created by Holofox on 06.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class BaseTableViewCell : UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
