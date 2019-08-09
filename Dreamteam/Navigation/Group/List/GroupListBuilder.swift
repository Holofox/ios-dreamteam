//
//  GroupListBuilder.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class GroupListBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        
        let view = GroupListViewController()
            view.title = Constants.groups
      
        let router = GroupListRouter(view: view)
        let interactor = GroupListInteractor(database: RealmDatabase.shared)
        
        view.presenter = GroupListPresenter(
            view: view, interactor: interactor, router: router)
        
        return factory(view)
    }
}
