//
//  EditListBuilder.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class EditListBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        
        let view = EditListViewController()
            view.title = Constants.edit
        
        let router = EditListRouter(view: view)
        let interactor = EditListInteractor(database: RealmDatabase.shared)
        
        view.presenter = EditListPresenter(
            view: view, interactor: interactor, router: router)
        
        return factory(view)
    }
}
