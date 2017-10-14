//
//  DataManager.swift
//  news_json
//
//  Created by Ammy Pandey on 14/10/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import Foundation

class DataManager {
    
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var ssession: URLSession = URLSession(configuration: self.configuration)
    
    let url: URL
    
    init (url: URL) {self.url = url}
}

extension DataManager {
    
    static func getJsonDataFromUrl(_ jsonData: Data?) -> [String: AnyObject]? {
        
        if let data = jsonData {
            do {
               let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject]
                return jsonDictionary
            }catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
