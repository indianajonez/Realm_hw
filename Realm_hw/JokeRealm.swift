//
//  JokeRealm.swift
//  Realm_hw
//
//  Created by Ekaterina Saveleva on 12.08.2023.
//

import Foundation
import RealmSwift


final class JokeRealm: Object {
    
    @Persisted var id: String
    @Persisted var value: String
    @Persisted var created_at: String
    @Persisted var categories: List<String>
    @Persisted var downloadDate: Date
    
    
    
    
//    @objc dynamic var id: String?
//    @objc dynamic var value: String?
//    @objc dynamic var created_at: String?
//    @objc dynamic var categories: [String]
//
//
//    override class func primaryKey() -> String? {
//        "id"
//    }
//
//    convenience init(joke: Joke) {
//        self.init()
//        self.id = joke.id
//        self.value = joke.value
//        self.created_at = joke.created_at
//        self.categories = joke.
//    }
}

class CategoryList: Object {
    
    @Persisted var name: String = ""
    
    
}
