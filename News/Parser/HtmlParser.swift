//
//  HtmlParser.swift
//  News
//
//  Created by 김기현 on 2020/03/18.
//  Copyright © 2020 김기현. All rights reserved.
//

import Foundation

class HtmlParser {

    
    func sendRequest(url: String, completion: @escaping ([String]) -> Void) {
        let url: URL = URL(string: url)!
        let session = URLSession.shared
        var resultData = [String]()
        
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error as Any)
                return self.errorReturn(completion: completion)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return self.errorReturn(completion: completion)
            }
            
            print("encoding type: \(String(describing: response.textEncodingName))")
            print("HTTP Response: \(response.statusCode)")
            
            var encodeFail = false;
            
            let cp949 = String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0422))
            let euckr = String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0940))
            
            var result = String(data: data!, encoding: .utf8) ?? String(data: data!, encoding: euckr) ?? String(data: data!, encoding: cp949)
            
            if result == nil {
                result = String(data: data!, encoding: .ascii)
                encodeFail = true;
            }
            resultData = self.parseHtml(data: result ?? "")
            
//            if(resultData[0] == "" && resultData[1] == "") {
//                print("url:\(url.absoluteString), status:\(response.statusCode), data: \(String(describing: data)), result:\(String(describing: result)), dataLength: \((data?.count)!)")
//            }
            
            if encodeFail == true {
                resultData[0] = self.asciiToUTF8(str: resultData[0]) ?? ""
                resultData[1] = self.asciiToUTF8(str: resultData[1]) ?? ""
            }
            
            completion(resultData)
        }
        
        task.resume()
    }
    
    private func errorReturn(completion: @escaping ([String]) -> Void) {
        completion(["",""])
    }
    
    public func parseHtml(data: String) -> [String] {
        let mMetadata = data.getArrayAfterRegex(regex: "<meta[^<>]*[ ]+property=(\"|\')[^<>]*(\"|\')[ ]+content=(\"|\')[^<>]*(\"|\')[ ]*/?>")
        var image: String?
        var description: String?
        var answer = [String]()

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
                description = String(htmlEncodedString: attribute["content"] ?? "")
            }
        }
        
        answer = [image ?? "", description ?? ""]
        
        return answer
    }
    
    /**
        Ascii to UTF-8 convert.
        if it fail retun nil
     */
    func asciiToUTF8(str: String) -> String? {
        let buffer = str.data(using: String.Encoding.ascii)
        
        if buffer != nil {
            let strUTF8 = String(data: buffer!, encoding: String.Encoding.utf8)
            print("strUTF8: \(String(describing: strUTF8))")
            return strUTF8
        } else {
            return nil
        }
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
