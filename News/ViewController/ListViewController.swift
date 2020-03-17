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
    var newsItems = [[String:String]]()
    var item = [String:String]()
    
    var parse = Parse()
    var htmlParse = HtmlParse()
    
    func requestNewsInfo() {
        let url = "https://news.google.com/rss"
        
        guard let xmlParser = XMLParser(contentsOf: URL(string: url)!) else { return }
        
        xmlParser.delegate = parse
        xmlParser.parse()
        newsItems = parse.getNewsItems()
    }
    
    func requestNewsContent() {
        for newsItem in newsItems {
            var url = newsItem["link"]

            guard let xmlParser = XMLParser(contentsOf: URL(string: url!)!) else { continue }

            xmlParser.delegate = htmlParse
            xmlParser.parse()
        }
//        let newsItem = newsItems[0]
//        var url = newsItem["link"]
//
//        guard let xmlParser = XMLParser(contentsOf: URL(string: url!)!) else { return }
//
//        xmlParser.delegate = htmlParse
//        xmlParser.parse()
//        print(xmlParser.parserError)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNewsInfo()
        requestNewsContent()
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
