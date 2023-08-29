//
//  BookTitleList.swift
//  titlelist
//
//  Created by Boopathi on 22/08/23.
//

import UIKit

struct BookTitleList {
    
    func fetchTitles(completion:@escaping ([BookModel]) -> ()) {
        guard let urls = URL(string: "https://jsonplaceholder.typicode.com/photos")
        else {
//            print("Invalid url") 
            return
        }
        URLSession.shared.dataTask(with: urls) {data, reponse, error in
            let decodedData = try! JSONDecoder().decode([BookModel].self, from: data!)
            print(decodedData)
            DispatchQueue.main.async {
                completion(decodedData)
            }
        }.resume()
    }
    
}

//func loadData(completion:@escaping ([TitleLists]) -> ()) {
//    guard let urls = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
//        print("Invalid url...")
//        return
//    }
//    URLSession.shared.dataTask(with: urls) {data, response, error in
//        let titlels = try! JSONDecoder().decode([TitleLists].self, from: data!)
//        print(titlels)
//        DispatchQueue.main.async {
//            completion(titlels)
//        }
//    }.resume()
//}

//func fetchTitles() {
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
//    else { return }
//    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
//        if let error = error {
//            print("Error in fetching titles : \(error.localizedDescription)")
//        }
//
//        guard let jsonData = data else { return }
//
////            let decoder = JSONDecoder()
//
//        do {
//            let decodedData =  try JSONDecoder().decode(BookModel.self, from: jsonData)
//            print(decodedData)
//        } catch {
//            print("Error decoding data.")
//        }
//
//    }.resume()
//}
