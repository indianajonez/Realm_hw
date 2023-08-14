//
//  StorageService.swift
//  Realm_hw
//
//  Created by Ekaterina Saveleva on 12.08.2023.
//

import Foundation
import Realm
import RealmSwift


protocol IRealmService {

    func create(joke: Joke)
    func delete(joke: Joke)
    func fetchAll() -> [Joke]
}


final class Storage {
    
        
    static let shared = Storage()
    private init() {}
    
    func fetchAll() -> [JokeRealm] {
        do {
            let realm = try Realm()
            let objects = realm.objects(JokeRealm.self)
            
            guard let jokeRealms = Array(objects) as? [JokeRealm] else { return [] }
            
            return jokeRealms
        } catch {
            return []
        }
    }
    
    
    func create(joke: Joke) {
        let newJoke = JokeRealm()
        newJoke.id = joke.id
        newJoke.value = joke.value
        newJoke.categories.append(objectsIn: joke.categories)
        newJoke.created_at = joke.created_at
        newJoke.downloadDate = Date()
//        var list: [CategoryList] = []
        
        
//        if !joke.categories.isEmpty {
//            for index in 0...joke.categories.count - 1 {
//                let category = CategoryList()
//                category.name = joke.categories[index]
//                list.append(category)
//            }
//        }
        
//        newJoke.categories.append(objectsIn: list)
            
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(newJoke)
            }
        } catch {
            return
        }
    }
    
    func delete(joke: Joke) -> Bool {
        return true
    }
}

