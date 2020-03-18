//
//  HtmlParser.swift
//  News
//
//  Created by 김기현 on 2020/03/18.
//  Copyright © 2020 김기현. All rights reserved.
//

import Foundation

class HtmlParser {
    
//    init(url: String) {
//        self.url = URL(string: url)!
//    }
    
    func sendRequest(url: String) -> [String] {
        let url: URL = URL(string: url)!
        let session = URLSession.shared
        var resultData = [String]()
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                let result = String(data: data!, encoding: .utf8)
                resultData = self.parseHtml(data: result!)
            } else {
                print(error as Any)
            }
        }
        
        task.resume()
        
        return resultData
    }
    
    public func parseHtml(data: String) -> [String] {
        let mMetadata = data.getArrayAfterRegex(regex: "<meta[ ]+property=(\"|\')[^<>]*(\"|\')[ ]+content=(\"|\')[^<>]*(\"|\')[ ]*/?>")
        var array = [String]()
        var answer = [String]()
        
        for i in mMetadata {
            if i.contains("og:image") || i.contains("og:description") {
                array = i.getArrayAfterRegex(regex: "(?:(\'|\"))[^\"\']*(?:(\'|\"))")
                answer.append(array[1])
            }
        }
        
        answer = answer.map({(str:String)->String in
            var str2 = str
            str2.removeFirst()
            str2.removeLast()
            
            return str2
        })
        
        return answer
    }
}

extension String {
    func getArrayAfterRegex(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
