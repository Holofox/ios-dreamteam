//
//  NavigationBuilder.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootView)
            navController.navigationBar.isTranslucent = true
            navController.navigationBar.prefersLargeTitles = true
    
        return navController
    }
    
}
