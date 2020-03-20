//
//  Parse.swift
//  News
//
//  Created by 김기현 on 2020/03/17.
//  Copyright © 2020 김기현. All rights reserved.
//

import Foundation

class Parse: NSObject, XMLParserDelegate {
    var currentElement = ""
    var newsItem: RSSData?
    var newsItems = [RSSData]()
    
    var newsTitle = ""
    var newsLink = ""
    
    
    func parserDidStartDocument(_ parser: XMLParser) {
        newsItems = []
    }
    // 시작
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        
        if elementName == "item" {
            newsItem = RSSData()
            newsTitle = ""
            newsLink = ""
        }
    }
    
    // 내용
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if currentElement == "title" {
            newsTitle += string
        } else if currentElement == "link" {
            newsLink += string
        }
    }
    
    // 끝
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            newsItem?.title = newsTitle
            newsItem?.link = newsLink
            
            if newsItem != nil {
                newsItems.append(newsItem!)
            }
        }
    }
    
    func getNewsItems() -> [RSSData] {
        return newsItems
    }
}
