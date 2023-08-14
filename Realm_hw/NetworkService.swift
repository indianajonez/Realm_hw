//
//  NetworkService.swift
//  Realm_hw
//
//  Created by Ekaterina Saveleva on 12.08.2023.
//

import Foundation

// https://api.chucknorris.io/jokes/AONc06lISwSZVjqMW2gO3Q
// три этапа проверки: 1. проверить ошибки 2. код ответа  3. а данные пришли из ответа

// добавить индикатор загрузки -> включать и выключать его при загрузке шутки

enum NetworkError: Error {
    case statusCodeNot200
    case dataIsNil
    case ParsingError
}

class NetworkService {
    
    typealias Categories = [String]
    
    //метод/функуия , которая загружает шутки
    func downloadRandomJoke(completion: @escaping (Result<Joke, Error>) -> ()) {
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://api.chucknorris.io/jokes/random")!
        // .dataTask нашим запросом получим бинарные данные, то есьт объект типа Data
        let task = session.dataTask(with: url) { data, responce , error in
            // разбираем ответ из сети. Сперва ошибки
            if let error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            // проверяем код ответа
            let code = (responce as? HTTPURLResponse)?.statusCode
            if code != 200 {
                print("Error! Status code == \(String(describing: code))")
                completion(.failure(NetworkError.statusCodeNot200))
                return
            }
            // проверяем данные
            guard let data else {
                print("Data is nil")
                completion(.failure(NetworkError.dataIsNil))
                return
            }
            
            do {
                let joke = try JSONDecoder().decode(Joke.self, from: data)
                
                // нужно получить из словаря значения по ключу "value"

                    completion(.success(joke))
                
                
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func fetchCategories(completion: @escaping (Result<Categories, Error>) -> Void) {
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://api.chucknorris.io/jokes/categories")!
        // .dataTask нашим запросом получим бинарные данные, то есьт объект типа Data
        let task = session.dataTask(with: url) { data, responce , error in
            // разбираем ответ из сети. Сперва ошибки
            if let error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            // попробуйте ответ от NetworkService отдавать в основном потоке
            // проверяем код ответа
            let code = (responce as? HTTPURLResponse)?.statusCode
            if code != 200 {
                print("Error! Status code == \(String(describing: code))")
                completion(.failure(NetworkError.statusCodeNot200))
                return
            }
            // проверяем данные
            guard let data else {
                print("Data is nil")
                completion(.failure(NetworkError.dataIsNil))
                return
            }
            
            do {
                let categories = try JSONDecoder().decode(Categories.self, from: data)
                
                // нужно получить из словаря значения по ключу "value"
                DispatchQueue.main.async {
                    completion(.success(categories))
                }
                
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}

