//
//  JokeModel.swift
//  Realm_hw
//
//  Created by Ekaterina Saveleva on 12.08.2023.
//

import Foundation


struct Joke: Codable {
    
//    static let dateFormatter: DateFormatter = {
//           let df = DateFormatter()
//           df.dateFormat = "dd.MM.yyyy"
//           return df
//       }()
    
    let id: String
    let created_at: String
    let value: String
    let categories: [String]
    
//    var keyedValues: [String: Any] {
//           [
//               "id" : id,
//               "value" : value,
//               "created_at" : created_at
//
//           ]
//       }
    
//    var createdAtString: String {
//           Self.dateFormatter.string(from: created_at)
//       }
    
//    init(from jokeRealm: JokeReaml) {
//        self.id = jokeRealm.id ?? ""
//        self.value = jokeRealm.value ?? ""
//        self.created_at = jokeRealm.created_at ?? ""
//
//    }
    
    init(id: String, value: String, created_at: String, categories: [String]) {
        self.id = id
        self.value = value
        self.created_at = created_at
        self.categories = categories
    }
}

