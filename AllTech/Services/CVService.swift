//
//  CVService.swift
//  AllTech
//
//  Created by Serxhio Gugo on 9/17/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import Foundation

class CVService: NSObject {
    
    static let shared = CVService()
    private let baseUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fe79aa80ed7b49f5bdf68592100a2b96"
                        
    
    func fetchNews(completion: @escaping (CVModel? , Error?) -> () ) {
        
        guard let url = URL(string: baseUrl) else { return }

        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                print("Failed fetching the news", error)
            }
            guard let data = data else { return }
            do {
                let news = try JSONDecoder().decode(CVModel.self, from: data)
                DispatchQueue.main.async {
                    completion(news, nil)
                }
            } catch let jsonError {
                print("Failed to decode", jsonError)
            }
            
        }.resume()
    }
    
    
}










