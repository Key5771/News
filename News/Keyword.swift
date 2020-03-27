//
//  Keyword.swift
//  News
//
//  Created by 김기현 on 2020/03/26.
//  Copyright © 2020 김기현. All rights reserved.
//

import Foundation

class KeywordData {
    var keyword: String = ""
    var count: Int = 0
    
    init(keyword: String, count: Int) {
        self.keyword = keyword
        self.count = count
    }
}

class Keyword {
    
    func getKeyword(str: String) -> [String] {
        let arr = str.components(separatedBy: [" ","\n","\t",",",".","…","(",")","[","]","{","}","<",">","【","】","/","\"","“","”","'","‘","’","`"])
        var data = [KeywordData]()
        var dict = [String:Int]()
        var answer = [String]()
        
        for str in arr{
            dict[str] = (dict[str] ?? 0) + 1
        }
        
        for (key, value) in dict {
            if key.count < 2 {
                continue
            }
            data.append(KeywordData(keyword: key, count: value))
        }
        
        data = data.sorted(by: { (lhs, rhs) -> Bool in
            if lhs.count == rhs.count {
                return lhs.keyword < rhs.keyword
            }
            return lhs.count > rhs.count
        })
        
        while(data.count > 0 && answer.count < 3){
            answer.append(data.removeFirst().keyword)
        }
        
        return answer
    }
}

extension KeywordData: CustomStringConvertible {
    var description: String {
        return "(\(keyword), \(count))"
    }
}
