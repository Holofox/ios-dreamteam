//
//  EntriesListBuilder.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class EntriesListBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        
        let view = EntriesListViewController()
            view.title = Constants.entries
        
        let router = EntriesListRouter(view: view)
        let interactor = EntriesListInteractor(database: RealmDatabase.shared)
        
        view.presenter = EntriesListPresenter(
            view: view, interactor: interactor, router: router)
        
        return factory(view)
    }
}
