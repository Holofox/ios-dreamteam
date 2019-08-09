//
//  EditDetailInteractor.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

protocol EditDetailUseCase {
    func updateEntry(entry: EntryItem) -> Bool
}

class EditDetailInteractor : EditDetailUseCase {
    var database: DreamTeamDB
    
    init(database: DreamTeamDB) {
        self.database = database
    }
}

extension EditDetailInteractor {
    func updateEntry(entry: EntryItem) -> Bool {
        return self.database.update(item: RealmEntryItem(listItem: entry))
    }
}
