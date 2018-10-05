//
//  CVModel.swift
//  AllTech
//
//  Created by Serxhio Gugo on 9/17/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import Foundation

struct CVModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author, title, description, url: String
    let urlToImage, publishedAt, content: String
}

struct Source: Codable {
    let id: ID?
    let name: Name
}
enum ID: String, Codable {
    case engadget = "engadget"
    case techcrunch = "techcrunch"
    case theVerge = "the-verge"
}

enum Name: String, Codable {
    case engadget = "Engadget"
    case lifehackerCOM = "Lifehacker.com"
    case techCrunch = "TechCrunch"
    case theVerge = "The Verge"
}

//enum ID: String, Codable {
//    case techcrunch = "techcrunch"
//}
//
//enum Name: String, Codable {
//    case techCrunch = "TechCrunch"
//}
