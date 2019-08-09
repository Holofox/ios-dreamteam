//
//  GroupListPresenter.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

protocol GroupListPresentation {
    func viewDidLoad() -> Void
}

class GroupListPresenter {
    weak var view: GroupListViewController?
    var interactor: GroupListUseCase
    var router: GroupListRouting
    
    init(view: GroupListViewController, interactor: GroupListUseCase, router : GroupListRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension GroupListPresenter: GroupListPresentation {
    func viewDidLoad() {
        self.interactor.getGroups(completion: { (result) in
            self.view?.updateGroupList(groups: result)
        })
    }
}
