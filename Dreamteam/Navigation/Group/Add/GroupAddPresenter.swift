//
//  GroupAddPresenter.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import Foundation

protocol GroupAddPresentation {
    func viewDidLoad() -> Void
    func onAddGroup(group: GroupItem) -> Void
}

class GroupAddPresenter {
    weak var view: GroupAddViewController?
    var interactor: GroupAddUseCase
    var router: GroupAddRouting
    
    init(view: GroupAddViewController, interactor: GroupAddUseCase, router : GroupAddRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension GroupAddPresenter: GroupAddPresentation {
    func viewDidLoad() {
        self.interactor.getEntries(completion: { (result) in
            self.view?.updateList(entries: result)
        })
    }
    
    func onAddGroup(group: GroupItem) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let updated = self?.interactor.addGroup(group: group)
            print("Group updated with result: \(String(describing: updated))")
        }
    }
}
