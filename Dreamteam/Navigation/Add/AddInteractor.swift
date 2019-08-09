//
//  AddInteractor.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

protocol AddUseCase {
    func addEntry(entry: EntryItem) -> Bool
}

class AddInteractor : AddUseCase {
    var database: DreamTeamDB
    
    init(database: DreamTeamDB) {
        self.database = database
    }
}

extension AddInteractor {
    func addEntry(entry: EntryItem) -> Bool {
        return self.database.update(item: RealmEntryItem(listItem: entry))
    }
}
