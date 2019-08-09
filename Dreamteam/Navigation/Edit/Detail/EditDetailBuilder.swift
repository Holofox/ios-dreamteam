//
//  EditDetailBuilder.swift
//  dreamteam
//
//  Created by Holofox on 07.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class EditDetailBuilder {
    
    static func build(entry: RealmEntryItem?) -> UIViewController {
        
        let view = EditDetailViewController()
            view.entry = entry
        
        let router = EditDetailRouter(view: view)
        let interactor = EditDetailInteractor(database: RealmDatabase.shared)
        
        view.presenter = EditDetailPresenter(
            view: view, interactor: interactor, router: router)
        
        return view
    }
}
