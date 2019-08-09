//
//  TabBarController.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

typealias NavTabs = (
    entries: UINavigationController,
    add: UINavigationController,
    edit: UINavigationController,
    group: UINavigationController
)

class TabBarController: UITabBarController {
    
    init(tabs: NavTabs) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.entries, tabs.add, tabs.edit, tabs.group]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
