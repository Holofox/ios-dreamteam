//
//  RealmGroupItem.swift
//  dreamteam
//
//  Created by Holofox on 04.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import Foundation
import RealmSwift

class RealmGroupItem: Object {
    
    @objc dynamic var groupId = NSUUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var desc = ""
    @objc dynamic var mark: Marks = .green
    @objc dynamic var picturePath: String = ""
    var entries = List<RealmEntryItem>()
    
    override static func primaryKey() -> String? {
        return "groupId"
    }
}

extension RealmGroupItem {
    
    convenience init(groupItem: GroupItem) {
        self.init()
        self.title = groupItem.title
        self.desc = groupItem.desc
        self.mark = groupItem.mark
        self.picturePath = groupItem.picturePath
        self.entries.append(objectsIn: groupItem.entries.compactMap({RealmEntryItem(listItem: $0)}))
    }
    
}

extension GroupItem {
    
    init(realmGroupItem: RealmGroupItem) {
        self.title = realmGroupItem.title
        self.desc = realmGroupItem.desc
        self.mark = realmGroupItem.mark
        self.picturePath = realmGroupItem.picturePath
        self.entries = realmGroupItem.entries.compactMap({EntryItem(realmListItem: $0)})
    }
}
