//
//  EntryItem.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

struct EntryItem {
    var id: String?
    var title: String
    var desc: String
    var mark: Marks
    var picturePath: String
    
    init(title: String, desc: String, mark: Marks, picturePath: String) {
        self.title = title
        self.desc = desc
        self.mark = mark
        self.picturePath = picturePath
    }
 
    init(id: String, title: String, desc: String, mark: Marks, picturePath: String) {
        self.id = id
        self.title = title
        self.desc = desc
        self.mark = mark
        self.picturePath = picturePath
    }
    
}
