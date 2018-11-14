//
//  TVService.swift
//  AllTech
//
//  Created by Serxhio Gugo on 10/3/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import Foundation

class TVService {
    
    static let shared = TVService()
    private let baseURL = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fe79aa80ed7b49f5bdf68592100a2b96"
    //https://newsapi.org/v2/everything?q=technology&sortBy=popularity&apiKey=fe79aa80ed7b49f5bdf68592100a2b96
    //"https://newsapi.org/v2/everything?q=techcrunch&sortBy=popularity&apiKey=fe79aa80ed7b49f5bdf68592100a2b96"
    func fetchNewsForTV(completion: @escaping (TVModel?, Error?) -> ()) {
        
        guard let url = URL(string: baseURL) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                print("Error fetching the news", error)
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(nil, error)
                print("Server bad response 404")
                return
            }
            
            guard let data = data else { return }
            do {
                let news = try JSONDecoder().decode(TVModel.self, from: data)
                DispatchQueue.main.async {
                    completion(news, nil)
                }
                
            } catch  let jsonError {
                print("Unable to decode", jsonError)
            }
            
        }.resume()
    }
}
