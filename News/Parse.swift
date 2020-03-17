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
    var newsItem = [String:String]()
    var newsItems = [[String:String]]()
    
    var newsTitle = ""
    var newsLink = ""
    
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
    
    func getNewsItems() -> [[String:String]] {
        return newsItems
    }
}
