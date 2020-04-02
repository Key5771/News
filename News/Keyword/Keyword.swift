//
//  Keyword.swift
//  News
//
//  Created by 김기현 on 2020/03/26.
//  Copyright © 2020 김기현. All rights reserved.
//

import Foundation

class Keyword {
    /// 문자열을 분석해서 키워드를 최대 3개 반환함.
    static func getKeyword(str: String) -> [String] {
        let arr = str.components(separatedBy: [" ","\n","\t",",",".","…","(",")","[","]","{","}","<",">","【","】","/","\"","“","”","'","‘","’","`"])
        var dict = [String:Int]()
        var answer = [String]()
        
        for str in arr {
            dict[str] = dict[str, default: 0] + 1
        }
        
        answer = dict
            .filter({ $0.key.count > 1 })
            .sorted(by: { (lhs, rhs) -> Bool in
                if lhs.value == rhs.value {
                    return lhs.key < rhs.key
                }
                return lhs.value > rhs.value
            }).prefix(3)
            .map({ $0.0 })
        
        return answer
    }
}
