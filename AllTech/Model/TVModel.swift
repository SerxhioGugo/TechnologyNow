//
//  TVModel.swift
//  AllTech
//
//  Created by Serxhio Gugo on 10/3/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import Foundation

struct TVModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [TVArticle]
}

struct TVArticle: Codable {
    let source: Source
    let author, title, description, url: String
    let urlToImage, publishedAt, content: String
}

struct TVSource: Codable {
    let tvid: tvID?
    let tvname: tvName
}
enum tvID: String, Codable {
    case engadget = "engadget"
    case techcrunch = "techcrunch"
    case theVerge = "the-verge"
}

enum tvName: String, Codable {
    case engadget = "Engadget"
    case lifehackerCOM = "Lifehacker.com"
    case techCrunch = "TechCrunch"
    case theVerge = "The Verge"
}
