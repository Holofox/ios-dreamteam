//
//  EntriesDetailPresenter.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

protocol EntriesDetailPresentation {
    
}

class EntriesDetailPresenter {
    weak var view: EntriesDetailViewController?
    var interactor: EntriesDetailUseCase
    var router: EntriesDetailRouting
    
    init(view: EntriesDetailViewController, interactor: EntriesDetailUseCase, router : EntriesDetailRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension EntriesDetailPresenter: EntriesDetailPresentation {
    
}
