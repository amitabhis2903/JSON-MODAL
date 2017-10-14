//
//  Articles.swift
//  news_json
//
//  Created by Ammy Pandey on 14/10/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import Foundation


class Articles {
    
    var author: String?
    var title: String?
    var discription: String?
    var url: URL?
    var publish: String?
    
    init(auhtor: String, title: String, discription: String, url: URL, publish: String, author: String) {
        self.title = title
        self.author = author
        self.discription = discription
        self.url = url
        self.publish = publish
    }
    
    init(authorDictionary: [String: AnyObject]) {
        self.title = authorDictionary["title"] as? String
        self.author = authorDictionary["author"] as? String
        self.discription = authorDictionary["description"] as? String
        self.url = URL(string: authorDictionary["url"] as! String)
        self.publish = authorDictionary["publishedAt"] as? String
    }
    
    static func downloadAllArticles() -> [Articles] {
        
        var articles = [Articles]()
        
        let url = URL(string: "https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=7128c0bb961741b99d59fbb69011f3fc")!
        let jsonData = try? Data(contentsOf: url)
        
        if let jsonDictionaries = DataManager.getJsonDataFromUrl(jsonData) {
            
            let articleDictionary = jsonDictionaries["articles"] as! [[String: AnyObject]]
            for authorDictionary in articleDictionary {
                let newArticles = Articles(authorDictionary: authorDictionary)
                articles.append(newArticles)
                print(articles)
            }
        }
       return articles  
    }
    
}
