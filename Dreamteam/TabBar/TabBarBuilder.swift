//
//  TabBarBuilder.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class TabBarBuilder {
    
    static func build(usingNavControllers navControllers: TabBarRouter.NavControllers) -> UITabBarController {
        let tabs = TabBarRouter.tabs(usingNavControllers: navControllers)
        let tabBarController = TabBarController(tabs: tabs)
        
        return tabBarController
    }
}
