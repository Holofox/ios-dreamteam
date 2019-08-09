//
//  EntriesListPresenter.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import Foundation

protocol EntriesListPresentation {
    func viewDidLoad() -> Void
    func onGenerateTestEntries() -> Void
}

class EntriesListPresenter {

    weak var view: EntriesListView?
    var interactor: EntriesListUseCase
    var router: EntriesListRouting
    
    init(view: EntriesListView, interactor: EntriesListUseCase, router : EntriesListRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension EntriesListPresenter: EntriesListPresentation {
    
    func onGenerateTestEntries() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let items = [
                EntryItem(title: "Common fox", desc: "@juniperfoxx", mark: .yellow, picturePath: "https://dev.holofox.ru/foxes/fox.jpg"),
                EntryItem(title: "The cutest fox!", desc: "@juniperfoxx", mark: .red, picturePath: "https://dev.holofox.ru/foxes/cute_fox.jpg"),
                EntryItem(title: "Yes, she’s cheerful", desc: "@juniperfoxx", mark: .green, picturePath: "https://dev.holofox.ru/foxes/cheerful_fox.jpg")
            ]
            items.forEach { item in
                self?.interactor.addEntry(entry: item)
                print("Added test item: \(item.title)")
            }
        }
    }
    
    func viewDidLoad() {
        self.interactor.getEntries(completion: { (result) in
            self.view?.updateList(entries: result)
            
            result.isEmpty ? onGenerateTestEntries() : nil
            print("Let's go!")
        })
    }
    
}
