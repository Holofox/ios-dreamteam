//
//  AddPresenter.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import Foundation

protocol AddPresentation {
    func onAddEntry(item: EntryItem) -> Void
}

class AddPresenter {
    weak var view: AddViewController?
    var interactor: AddUseCase
    var router: AddRouting
    
    init(view: AddViewController, interactor: AddUseCase, router : AddRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension AddPresenter: AddPresentation {
    func onAddEntry(item: EntryItem) -> Void {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let updated = self?.interactor.addEntry(entry: item)
            print("Entry updated with result: \(String(describing: updated))")
        }
    }
}
