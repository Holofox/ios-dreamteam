//
//  EntriesListInteractor.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import RealmSwift

protocol EntriesListUseCase {
    func getEntries(completion: (Results<RealmEntryItem>) -> (Void))
    func addEntry(entry: EntryItem) -> Void
}

class EntriesListInteractor : EntriesListUseCase {
    var database: DreamTeamDB
    
    init(database: DreamTeamDB) {
        self.database = database
    }
}

extension EntriesListInteractor {
    
    func addEntry(entry: EntryItem) {
        _ = self.database.update(item: RealmEntryItem(listItem: entry))
    }
    
    func getEntries(completion: (Results<RealmEntryItem>) -> (Void)) {
        self.database.get { (result) in
            completion(result)
        }
    }
    
}
