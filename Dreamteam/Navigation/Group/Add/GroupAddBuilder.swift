//
//  GroupAddBuilder.swift
//  dreamteam
//
//  Created by Holofox on 07.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class GroupAddBuilder {
    
    static func build() -> UIViewController {
        
        let view = GroupAddViewController()
            view.title = Constants.addGroup
        
        let router = GroupAddRouter(view: view)
        let interactor = GroupAddInteractor(database: RealmDatabase.shared)
        
        view.presenter = GroupAddPresenter(view: view, interactor: interactor, router: router)
        
        return view
    }
}
