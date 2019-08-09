//
//  AddBuilder.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class AddBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        
        let view = AddViewController()
            view.title = Constants.add
        
        let router = AddRouter(view: view)
        let interactor = AddInteractor(database: RealmDatabase.shared)
        
        view.presenter = AddPresenter(
            view: view, interactor: interactor, router: router)
        
        return factory(view)
    }
}
