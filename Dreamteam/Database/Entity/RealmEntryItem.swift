//
//  RealmEntryItem.swift
//  dreamteam
//
//  Created by Holofox on 04.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import Foundation
import RealmSwift

class RealmEntryItem: Object {
    
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var mark: Marks = .green
    @objc dynamic var picturePath: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension RealmEntryItem {
    
    convenience init(listItem: EntryItem) {
        self.init()
        self.id = listItem.id ?? NSUUID().uuidString
        self.title = listItem.title
        self.desc = listItem.desc
        self.mark = listItem.mark
        self.picturePath = listItem.picturePath
    }
    
}

extension EntryItem {
    
    init(realmListItem: RealmEntryItem) {
        self.id = realmListItem.id
        self.title = realmListItem.title
        self.desc = realmListItem.desc
        self.mark = realmListItem.mark
        self.picturePath = realmListItem.picturePath
    }
}
