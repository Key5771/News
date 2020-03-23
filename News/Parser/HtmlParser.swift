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
    
    func sendRequest(url: String, completion: @escaping ([String]) -> Void) {
        let url: URL = URL(string: url)!
        let session = URLSession.shared
        var resultData = [String]()
        
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil {
                let korean = String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0422))
                let result = String(data: data!, encoding: .utf8) ?? String(data: data!, encoding: korean)
                print("url : \(url)")
                resultData = self.parseHtml(data: result ?? "")
                print("resultData : \(resultData)")
            } else {
                print(error as Any)
                resultData = ["", ""]
            }
            completion(resultData)
        }
        task.resume()
    }
    
    public func parseHtml(data: String) -> [String] {
        let mMetadata = data.getArrayAfterRegex(regex: "<meta[^<>]*[ ]+property=(\"|\')[^<>]*(\"|\')[ ]+content=(\"|\')[^<>]*(\"|\')[ ]*/?>")
        var image: String?
        var description: String?
        var answer = [String]()

        print("mMetadata: \(mMetadata)")
        for i in mMetadata {
            var attribute = [String:String]()
            let properties = i.getArrayAfterRegex(regex: "\\w+=((\"[^\"]*\"|\'[^\']*\')|[^\"\' ]*)")
            for property in properties {
                let a = property.split(separator: "=", maxSplits: 1)
                let key = String(a[0])
                var data = String(a[1])
                if (data.first == "\"" && data.last == "\"") || (data.first == "\'" && data.last == "\'") {
                    data.removeFirst()
                    data.removeLast()
                }
                attribute[key] = data
                print("key: \(key)")
                print("data: \(data)")
            }
            
            if(attribute["property"] == "og:image"){
                image = attribute["content"]
            } else if attribute["property"] == "og:description" {
                description = String(htmlEncodedString: attribute["content"] ?? "")
            }
            
        }
        
        answer = [image ?? "", description ?? ""]
        
        return answer
    }
}

extension String {
    init?(htmlEncodedString: String) {

        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }

        self.init(attributedString.string)
    }
    
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
