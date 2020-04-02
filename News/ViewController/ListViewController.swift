//
//  ViewController.swift
//  News
//
//  Created by 김기현 on 2020/03/17.
//  Copyright © 2020 김기현. All rights reserved.
//


import UIKit
import Kingfisher

class ListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    private let refreshController = UIRefreshControl()
    
    var xmlParser = XMLParser()
    var newsItems = [RSSData]()
    let url = "https://news.google.com/rss"
    var parse = Parse()
    var htmlParser = HtmlParser()
    var keyword = Keyword()
    
    func requestNewsInfo() {
        DispatchQueue.global().async {
            guard let url = URL(string: self.url),
                let xmlParser = XMLParser(contentsOf: url) else { return }
            
            xmlParser.delegate = self.parse
            xmlParser.parse()
            self.newsItems = self.parse.getNewsItems()
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshController.endRefreshing()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNewsInfo()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.refreshControl = refreshController
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        self.title = "News"
    }
    
    @objc func refresh() {
        requestNewsInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "content" {
            if let row = tableView.indexPathForSelectedRow {
                let vc = segue.destination as? ContentViewController
                let content = self.newsItems[row.row]
                
                vc?.newsItems = content
                
                tableView.deselectRow(at: row, animated: true)
            }
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        
        guard let cell = tableViewCell as? ListTableViewCell else {
            return tableViewCell
        }
        
        let url = newsItems[indexPath.row].link
        cell.link = url
        cell.titleLabel?.text = newsItems[indexPath.row].title
        
        
        cell.contentLabel?.text = newsItems[indexPath.row].description
        if let urlString = newsItems[indexPath.row].imageAddress {
            let url = URL(string: urlString)
            cell.thumbNailImage.kf.setImage(with: url, placeholder: UIImage(named: "noImage"))
        }
        if let result = newsItems[indexPath.row].keyword {
            if result.count > 0 {
                cell.firstLabel?.text = newsItems[indexPath.row].keyword?[0]
            }
            if result.count > 1 {
                cell.secondLabel?.text = newsItems[indexPath.row].keyword?[1]
            }
            if result.count > 2 {
                cell.thirdLabel?.text = newsItems[indexPath.row].keyword?[2]
            }
        }
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ListTableViewCell else { return }
        let url = newsItems[indexPath.row].link
        guard newsItems[indexPath.row].imageAddress == nil && newsItems[indexPath.row].description == nil else { return }
        
        htmlParser.sendRequest(url: url!) { (result: [String?]) in
            self.newsItems[indexPath.row].imageAddress = result[0]
            self.newsItems[indexPath.row].description = result[1]
            
            if let description = self.newsItems[indexPath.row].description {
                self.newsItems[indexPath.row].keyword = self.keyword.getKeyword(str: description)
            }
            
            DispatchQueue.main.async {
                guard cell.link == url else { return }
                
                cell.contentLabel?.text = result[1]
                if let imageUrl = result[0] {
                    let url = URL(string: imageUrl)
                    cell.thumbNailImage.kf.setImage(with: url, placeholder: UIImage(named: "noImage"))
                }
                
                guard let keywordResult = self.newsItems[indexPath.row].keyword else { return }
                
                if keywordResult.count > 0 {
                    cell.firstLabel?.text = keywordResult[0]
                }
                if keywordResult.count > 1 {
                    cell.secondLabel?.text = keywordResult[1]
                }
                if keywordResult.count > 2 {
                    cell.thirdLabel?.text = keywordResult[2]
                }
            }
        }
    }
}
