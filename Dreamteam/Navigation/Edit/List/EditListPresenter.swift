//
//  EditListPresenter.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

protocol EditListPresentation {
    func viewDidLoad() -> Void
}

class EditListPresenter {
    weak var view: EditListViewController?
    var interactor: EditListUseCase
    var router: EditListRouting
    
    init(view: EditListViewController, interactor: EditListUseCase, router : EditListRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension EditListPresenter: EditListPresentation {
    func viewDidLoad() {
        self.interactor.getEntries(completion: { (result) in
            self.view?.updateList(entries: result)
        })
    }
}
