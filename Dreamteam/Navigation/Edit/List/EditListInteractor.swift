//
//  EditListInteractor.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import RealmSwift

protocol EditListUseCase {
    func getEntries(completion: (Results<RealmEntryItem>) -> (Void))
}

class EditListInteractor : EditListUseCase {
    var database: DreamTeamDB
    
    init(database: DreamTeamDB) {
        self.database = database
    }
}

extension EditListInteractor {
    func getEntries(completion: (Results<RealmEntryItem>) -> (Void)) {
        self.database.get { (result) in
            completion(result)
        }
    }
}
