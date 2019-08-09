//
//  GroupAddInteractor.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//
import RealmSwift

protocol GroupAddUseCase {
    func getEntries(completion: (Results<RealmEntryItem>) -> (Void))
    func addGroup(group: GroupItem) -> Bool
}

class GroupAddInteractor : GroupAddUseCase {
    var database: DreamTeamDB
    
    init(database: DreamTeamDB) {
        self.database = database
    }
}

extension GroupAddInteractor {
    func getEntries(completion: (Results<RealmEntryItem>) -> (Void)) {
        self.database.get { (result) in
            completion(result)
        }
    }
    
    func addGroup(group: GroupItem) -> Bool {
        return self.database.update(item: RealmGroupItem(groupItem: group))
    }
}
