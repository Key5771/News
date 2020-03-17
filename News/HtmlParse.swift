//
//  HtmlParse.swift
//  News
//
//  Created by 김기현 on 2020/03/17.
//  Copyright © 2020 김기현. All rights reserved.
//

import Foundation

class HtmlParse: NSObject, XMLParserDelegate {
    var currentElement = ""
    var newsItem = [String:String]()
    
    var imageAddress = ""
    var keyword = ""
    
    // 시작
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
//        print("line: \(parser.lineNumber), elementName: \(elementName)")
        
        if elementName == "head" {
            newsItem = [String:String]()
            imageAddress = ""
            keyword = ""
        }
        
        if elementName == "meta" {
            if attributeDict["property"] == "og:image" {
                imageAddress = attributeDict["content"] ?? ""
            } else if attributeDict["property"] == "og:description" {
                keyword = attributeDict["content"] ?? ""
            }
        }
    }
    
//    // 내용
//    func parser(_ parser: XMLParser, foundCharacters string: String) {
//        if currentElement == "title" {
//            newsTitle = string
//        } else if currentElement == "link" {
//            newsLink = string
//        }
//    }
    
    // 끝
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "head" {
            newsItem["image"] = imageAddress
            newsItem["keyword"] = keyword
            
            parser.abortParsing()
        }
    }
    
    func getNewsItem() -> [String:String] {
        return newsItem
    }
}
