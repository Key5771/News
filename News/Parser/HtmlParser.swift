//
//  HtmlParser.swift
//  News
//
//  Created by 김기현 on 2020/03/18.
//  Copyright © 2020 김기현. All rights reserved.
//

import Foundation

class HtmlParser {

    func sendRequest(url: String, completion: @escaping ([String?]) -> Void) {
        guard let url = URL(string: url) else {
            completion([])
            return
        }
        let session = URLSession.shared
        var resultData = [String?]()
        
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                return self.errorReturn(completion: completion)
            }
            guard let data = data else {
                completion(["", ""])
                return
            }
            
            let cp949 = String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0422))
            let euckr = String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0940))
            
            let result = String(data: data, encoding: .utf8)
                ?? String(data: data, encoding: euckr)
                ?? String(data: data, encoding: cp949)
                ?? String(decoding: data, as: UTF8.self)
            
            resultData = self.parseHtml(data: result)
            
            completion(resultData)
        }
        
        task.resume()
    }
    
    private func errorReturn(completion: @escaping ([String]) -> Void) {
        completion(["",""])
    }
    
    public func parseHtml(data: String) -> [String?] {
        let mMetadata = data.getArrayAfterRegex(regex: "<meta\\s+(([\\w-]+=((\"[^\"]*\"|\'[^\']*\')|[^\"\' ]*))\\s*)+[^>]*/?>")
        var image: String?
        var description: String?
        var answer = [String?]()

        for i in mMetadata {
            var attribute = [String:String]()
            let properties = i.getArrayAfterRegex(regex: "\\w+=((\"[^\"]*\"|\'[^\']*\')|[^\"\' ]*)")
            for property in properties {
                let splitData = property.split(separator: "=", maxSplits: 1)
                let key = String(splitData[0])
                var data = String(splitData[1])
                if (data.first == "\"" && data.last == "\"") || (data.first == "\'" && data.last == "\'") {
                    data.removeFirst()
                    data.removeLast()
                }
                attribute[key] = data
            }
            
            if(attribute["property"] == "og:image"){
                image = attribute["content"]
            } else if attribute["property"] == "og:description" {
                description = String(htmlEncodedString: attribute["content"])
            }
        }
        
        answer = [image, description]
        
        return answer
    }
}

extension String {
    // https://stackoverflow.com/questions/25607247/how-do-i-decode-html-entities-in-swift
    init?(htmlEncodedString: String?) {
        guard let data = htmlEncodedString?.data(using: .utf8) else {
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
    
    // https://eunjin3786.tistory.com/12
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
