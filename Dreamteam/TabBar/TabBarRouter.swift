//
//  TabBarRouter.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class TabBarRouter {
    
    var viewController: UIViewController
    
    typealias NavControllers = (
        entries: UINavigationController,
        add: UINavigationController,
        edit: UINavigationController,
        group: UINavigationController
    )
    
    init(viewController: UINavigationController) {
        self.viewController = viewController
    }
    
}

extension TabBarRouter {
    
    static func tabs(usingNavControllers navControllers: NavControllers) -> NavTabs {
        
        let entriesTabBarItem = UITabBarItem(title: Constants.entries, image: UIImage(named: "entries"), tag: 1)
        let addTabBarItem = UITabBarItem(title: Constants.add, image: UIImage(named: "add"), tag: 2)
        let editTabBarItem = UITabBarItem(title: Constants.edit, image: UIImage(named: "edit"), tag: 3)
        let groupTabBarItem = UITabBarItem(title: Constants.groups, image: UIImage(named: "groups"), tag: 4)
        
        navControllers.entries.tabBarItem = entriesTabBarItem
        navControllers.add.tabBarItem = addTabBarItem
        navControllers.edit.tabBarItem = editTabBarItem
        navControllers.group.tabBarItem = groupTabBarItem
        
        return(
            entries: navControllers.entries,
            add: navControllers.add,
            edit: navControllers.edit,
            group: navControllers.group
        )
    }
    
}
