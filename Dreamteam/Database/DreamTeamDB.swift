//
//  DreamTeamDB.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import UIKit
import RealmSwift

typealias RealmEntry = Object

protocol DreamTeamDB {    
    func get<T: RealmEntry>(completion: (Results<T>) -> (Void))
    func update<T: RealmEntry>(item: T) -> (Bool)
}
