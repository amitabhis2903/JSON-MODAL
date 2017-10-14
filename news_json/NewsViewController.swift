//
//  NewsViewController.swift
//  news_json
//
//  Created by Ammy Pandey on 14/10/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var newsTable: UITableView!
    var articles = [Articles]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articles = Articles.downloadAllArticles()
        DispatchQueue.main.async {
           self.newsTable.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let article = articles[indexPath.row]
        cell?.textLabel?.text = article.title
        cell?.detailTextLabel?.text = article.publish
        
        return cell!  
    }
}

