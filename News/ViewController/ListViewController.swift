//
//  ViewController.swift
//  News
//
//  Created by 김기현 on 2020/03/17.
//  Copyright © 2020 김기현. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var xmlParser = XMLParser()
    var currentElement = ""
    var newsItems = [[String:String]]()
    var newsItem = [String:String]()
    
    var newsTitle = ""
    var newsLink = ""
    
    func requestNewsInfo() {
        let url = "https://news.google.com/rss"
        
        guard let xmlParser = XMLParser(contentsOf: URL(string: url)!) else { return }
        
        xmlParser.delegate = self
        xmlParser.parse()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNewsInfo()
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        
        cell.titleLabel?.text = newsItems[indexPath.row]["title"]
        cell.contentLabel?.text = newsItems[indexPath.row]["link"]
        
        return cell
    }
    
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListViewController: XMLParserDelegate {
    // 시작
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        
        if elementName == "item" {
            newsItem = [String:String]()
            newsTitle = ""
            newsLink = ""
        }
    }
    
    // 내용
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if currentElement == "title" {
            newsTitle = string
        } else if currentElement == "link" {
            newsLink = string
        }
    }
    
    // 끝
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            newsItem["title"] = newsTitle
            newsItem["link"] = newsLink
            
            newsItems.append(newsItem)
        }
    }
    
    
}
