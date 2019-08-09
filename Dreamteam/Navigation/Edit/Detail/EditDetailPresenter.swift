//
//  EditDetailPresenter.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import Foundation

protocol EditDetailPresentation {
    func onUpdateEntry(item: EntryItem) -> Void
}

class EditDetailPresenter {
    weak var view: EditDetailViewController?
    var interactor: EditDetailUseCase
    var router: EditDetailRouting
    
    init(view: EditDetailViewController, interactor: EditDetailUseCase, router : EditDetailRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension EditDetailPresenter: EditDetailPresentation {
    func onUpdateEntry(item: EntryItem) -> Void {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let updated = self?.interactor.updateEntry(entry: item)
            print("Entry updated with result: \(String(describing: updated))")
        }
    }
}
