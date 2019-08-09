//
//  GroupItem.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

struct GroupItem {
    let title: String
    let desc: String
    var mark: Marks = .green
    let picturePath: String
    var entries: [EntryItem]
    
    init(title: String, desc: String, mark: Marks, picturePath: String, entries: [EntryItem]) {
        self.title = title
        self.desc = desc
        self.mark = mark
        self.picturePath = picturePath
        self.entries = entries
    }
    
}
