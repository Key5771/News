//
//  NewsTests.swift
//  NewsTests
//
//  Created by 김기현 on 2020/03/18.
//  Copyright © 2020 김기현. All rights reserved.
//

import XCTest
@testable import News

class NewsTests: XCTestCase {
    
//    var parser = HtmlParser(url: "dsfhdksjhfjksdh")

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let str = """
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
        <head>
        <title>[정치]문 대통령 "소득 하위 70%·4인 가구 백만 원...이르면 5월 지급" | YTN</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta property="og:title" content="문 대통령 &quot;소득 하위 70%·4인 가구 백만 원...이르면 5월 지급&quot;" />
        <meta property="og:type" content="article" />
        <meta property="og:url" content="https://www.ytn.co.kr/_ln/0101_202003301819568696" />
        <meta property="og:image" content="https://image.ytn.co.kr/general/jpg/2020/0330/202003301819568696_t.jpg" />
        <meta property='dable:image' content='https://image.ytn.co.kr/general/jpg/2020/0330/202003301819568696_k.jpg'>
        <link rel="image_src" href="https://image.ytn.co.kr/general/jpg/2020/0330/202003301819568696_t.jpg" />
        <meta property="og:description" content="[앵커]문재인 대통령이 소득 하위 70%에 해당하는 약 천4백..." />
        <meta property="dable:item_id" content="202003301819568696">
        <meta property="article:published_time" content="2020-03-30T18:19:00+09:00">
        <meta property="article:section" content="뉴스"> <!-- 메인 카테고리 (필수) -->
        <meta property="article:section2" content="정치"> <!-- 2차 카테고리가 있는 경우 추가 --><meta property="dable:url" content="https://www.ytn.co.kr/_ln/0101_202003301819568696"/>
        <link rel='canonical' href='https://www.ytn.co.kr/_ln/0101_202003301819568696'>
        <link rel='alternate' media='only screen and (max-width: 640px)' href='https://m.ytn.co.kr/news_view.php?key=202003301819568696&s_mcd=0101'>
        <link rel='amphtml' href = 'https://m.ytn.co.kr/news_view.amp.php?param=0101_202003301819568696'>
        """

        let parser: HtmlParser = HtmlParser()
        let res = parser.parseHtml(data: str)
        XCTAssert(res[0] == "https://image.ytn.co.kr/general/jpg/2020/0330/202003301819568696_t.jpg")
        XCTAssert(res[1] == "[앵커]문재인 대통령이 소득 하위 70%에 해당하는 약 천4백...")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.ㄴ
        }
    }

}
