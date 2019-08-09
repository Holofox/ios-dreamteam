//
//  GroupListInteractor.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import RealmSwift

protocol GroupListUseCase {
    func getGroups(completion: (Results<RealmGroupItem>) -> (Void))
}

class GroupListInteractor : GroupListUseCase {
    var database: DreamTeamDB
    
    init(database: DreamTeamDB) {
        self.database = database
    }
}

extension GroupListInteractor {
    func getGroups(completion: (Results<RealmGroupItem>) -> (Void)) {
        self.database.get { (result) in
            completion(result)
        }
    }
}
