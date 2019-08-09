//
//  RealmDatabase.swift
//  dreamteam
//
//  Created by Holofox on 05.08.2019.
//  Copyright © 2019 Holofox. All rights reserved.
//

import RealmSwift
import Foundation

class RealmDatabase {
    static let shared : RealmDatabase = RealmDatabase()
    
    private init() {}
}

extension RealmDatabase : DreamTeamDB {
    
    func get<T>(completion: (Results<T>) -> (Void)) where T : RealmEntry {
        do {
            let realm = try Realm()
            // print("Realm:", Realm.Configuration.defaultConfiguration.fileURL ?? "")
            let result = realm.objects(T.self)
            completion(result)
        } catch {
            print("Something went wrong with error: \(error)")
        }
    }
    
    func update<T>(item: T) -> (Bool) where T: RealmEntry {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(item, update: .all)
            }
        } catch {
            print("Something went wrong with error: \(error)")
            return false
        }
        return true
    }
    
}
