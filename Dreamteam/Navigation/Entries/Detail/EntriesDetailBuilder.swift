//
//  EntriesDetailBuilder.swift
//  dreamteam
//
//  Created by Holofox on 07.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit

class EntriesDetailBuilder {
    
    static func build(entry: RealmEntryItem?) -> UIViewController {
        
        let view = EntriesDetailViewController()
            view.entry = entry

        let router = EntriesDetailRouter(view: view)
        let interactor = EntriesDetailInteractor()
        
        view.presenter = EntriesDetailPresenter(
            view: view, interactor: interactor, router: router)
        
        return view
    }
}
