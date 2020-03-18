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
    
    var parser = HtmlParser(url: "dsfhdksjhfjksdh")

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
        <title>[사회]어제 93명 추가...전체 확진자 8,413명으로 늘어 | YTN</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta property="og:title" content="어제 93명 추가...전체 확진자 8,413명으로 늘어" />
        <meta property="og:type" content="article" />
        <meta property="og:url" content="https://www.ytn.co.kr/_ln/0103_202003181155552545" />
        <meta property="og:image" content="https://image.ytn.co.kr/general/jpg/2020/0318/202003181155552545_t.jpg" />
        <meta property='dable:image' content='https://image.ytn.co.kr/general/jpg/2020/0318/202003181155552545_k.jpg'>
        <link rel="image_src" href="https://image.ytn.co.kr/general/jpg/2020/0318/202003181155552545_t.jpg" />
        <meta property="og:description" content="[앵커]어제 하루 국내 코로나 19 환자가 93명 새로 확인돼,..." />
        <meta property="dable:item_id" content="202003181155552545">
        <meta property="article:published_time" content="2020-03-18T11:55:00+09:00">
        <meta property="article:section" content="뉴스"> <!-- 메인 카테고리 (필수) -->
        <meta property="article:section2" content="사회"> <!-- 2차 카테고리가 있는 경우 추가 --><meta property="dable:url" content="https://www.ytn.co.kr/_ln/0103_202003181155552545"/>
        <link rel='canonical' href='https://www.ytn.co.kr/_ln/0103_202003181155552545'>
        <link rel='alternate' media='only screen and (max-width: 640px)' href='https://m.ytn.co.kr/news_view.php?key=202003181155552545&s_mcd=0103'>
        <link rel='amphtml' href = 'https://m.ytn.co.kr/news_view.amp.php?param=0103_202003181155552545'>
        <script type="application/ld+json">
                {
                    "@context": "http://schema.org",
                    "@type": "NewsArticle",
                    "mainEntityOfPage": "https://www.ytn.co.kr/_ln/0103_202003181155552545",
                    "headline": "어제 93명 추가...전체 확진자 8,413명으로 늘어",
                    "datePublished": "2020-03-18T11:55:00+09:00",
                    "dateModified": "2020-03-18T11:55:00+09:00",
                    "description": "[앵커]어제 하루 국내 코로나 19 환자가 93명 새로 확인돼, 전체 환자 수는 8천4백 명을 넘어섰습니다.사망자는 3명 늘어 84명이 됐습니다.취재기자 연결해보겠...",
                    "author": {
                        "@type": "Person",
                        "name": "김종균"
                    },
                    "publisher": {
                        "@type": "Organization",
                        "name": "YTN",
                        "logo": {
                            "@type": "ImageObject",
                            "url": "https://www.ytn.co.kr/img/main/logo.png",
                            "width": 200,
                            "height": 60
                        }
                    },
                    "image": {
                        "@type": "ImageObject",
                        "url": "https://image.ytn.co.kr/general/jpg/2020/0318/202003181155552545_k.jpg",
                        "height": 245,
                        "width": 138
                    }
                }</script>
        <meta property="dd:content_id" content="202003181155552545" />
        <meta property="dd:playtime" content="" />
        <meta property="dd:author" content="김종균" />
        <meta property="dd:category" content="사회" />
        <meta property="dd:published_time" content="2020-03-18T11:55:00+09:00" />
        <meta property="dd:modified_time" content="2020-03-18T11:55:00+09:00" />
        <meta property="dd:publisher" content="YTN" />
        <meta property="dd:availability" content="true" />
        <meta name="twitter:card" content="summary"/>
        <meta name="twitter:card" content="summary_large_image"/>
        <meta name="viewport" content="width=device-width" />
        <meta name="naver-site-verification" content="b103fc9d6193ce7c65a6ad5a9fd971b64f43c1b5"/>
        <meta name='title' content='[사회]어제 93명 추가...전체 확진자 8,413명으로 늘어 | YTN'/>
        <meta name='description' content='코로나19 사망 3명 추가…누적 사망자 84명으로 늘어 / 어제 하루 완치자 139명 추가…1,540명 격리해제 / 대구 46명 추가(6,144명)…경북 9명 추가(1,178명) / 수도권 21명 ...'/>
        <link href="../img/comm/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <link rel="apple-touch-icon" href="/img/comm/favicon2.ico" />
        <link rel="stylesheet" type="text/css" href="../css/comm_n.css?v=202003171526"/>
        <link rel="stylesheet" type="text/css" href="../css/news.css?v=20140821" />
        <link rel="stylesheet" type="text/css" href="../css/etc_n.css?v=20181128" />
        <link rel="stylesheet" type="text/css" href="../css/ad.css?v=20150212" />
        <script type="text/javascript" src="../_js/ytn.js?v=20191213"></script>
        <script type="text/javascript" src="../_js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="../_js/jquery.lazyloadxt.min.js?v=201704143"></script>
        <noscript>
            <h2>
            &nbsp;&nbsp;&nbsp;&nbsp;이 사이트의 기능을 모두 활용하기 위해서는 자바스크립트를 활성화 시킬 필요가 있습니다.<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="http://www.enable-javascript.com/ko/" target="_blank" style="color:red">브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
            </h2>
        </noscript>
        <script type="text/javascript">_L('0103','V','');</script>
        <script type="text/javascript">
        //검색 점검여부 확인
        function searchChk()
        {
            var dt;
            dt = new Date();
            var limit = dt.getFullYear() + ("00" + (dt.getMonth() + 1)).slice(-2) + ("00" + dt.getDate()).slice(-2) + ("00" + dt.getHours()).slice(-2)  + ("00" + dt.getMinutes()).slice(-2);
            if(limit >= '202002010100' && limit <= '202002010100'){
                alert('안정적인 서비스 제공을 위하여 서버 점검이 진행될 예정입니다.\n아래 작업 시간동안 검색 서비스가 제한되오니 이용자 여러분의 많은 양해 바랍니다.\n※ 작업시간: 01:00 ~ 02:00');
            }
            return search(this);
        }
        //console.log("referrer : " + document.referrer);
        //console.log("ip : " + "10.10.1.26");
        </script>

        <!-- //YTN -->
        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-39886335-1', 'ytn.co.kr');
          ga('send', 'pageview');

        </script>

        <!-- Google Tag Manager -->
        <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-5HVZXSM');</script>
        <!-- End Google Tag Manager -->

        <!-- Dable 스크립트 시작 / 문의 support@dable.io -->
        <script>
        (function(d,a,b,l,e,_) {
        d[b]=d[b]||function(){(d[b].q=d[b].q||[]).push(arguments)};e=a.createElement(l);
        e.async=1;e.charset='utf-8';e.src='//static.dable.io/dist/plugin.min.js';
        _=a.getElementsByTagName(l)[0];_.parentNode.insertBefore(e,_);
        })(window,document,'dable','script');
        dable('setService', 'ytn.co.kr');
        dable('sendLog');
        </script>
        <!-- Dable 스크립트 종료 / 문의 support@dable.io -->
        <style type="text/css">
        body {background:none;}
        /****************************헤더****************************/
        #clone  { display:block; z-index:999; position:fixed; width:100%; margin:0 auto; top: 0px;}
        #wrap {position: relative;}
        #YTN_main_2017 .wrap {position: relative;overflow: hidden;min-width:990px;}
        #YTN_main_2017 .header {background:url('../img/main/top_bg.gif');background-repeat:repeat-x; background-size:1px 209px; height:209px;}
        #YTN_main_2017 .header_clone {}
        #YTN_main_2017 .total_bg { position:relative; height:210px;}
        #YTN_main_2017 .bg_clone { height:45px; background:#000;position:relative; }
        #YTN_main_2017 .gray_bg { height:37px; background:#DBDBDB;position:absolute; top:45px; width:100%}
        #YTN_main_2017 .total_bg .area_flex { position:relative;margin:0 auto;width:990px; height:100%;}
        #YTN_main_2017 .total_bg .area_flex .logo {position:relative; margin:0 auto; height:100%;}
        #YTN_main_2017 .total_bg .area_flex .logo h1 {position:absolute; top:50%; left:-2px; margin-top:-55px; background:url('../img/main/logo_slo.jpg');background-repeat:no-repeat;width:201px;height:100px;}
        #YTN_main_2017 .logo .ytn_logo {display: block;overflow: hidden;width: 202px;height: 100px;background-position: 0 0;text-indent: 101%;white-space: nowrap;}
        #YTN_main_2017 .links {position: absolute; top:11px;left: -5px; zoom:1;}
        #YTN_main_2017 .links a {display:inline-block; margin:0 4px;letter-spacing:-1px;}
        #YTN_main_2017 .links .links_bar { background:url('../img/main/link_bar.gif')0 5px ;background-repeat:no-repeat; width:1px; height:13px; display:inline-block; }
        #YTN_main_2017 .links .barlast{ /*background:url('img/main/link_bar.gif')no-repeat 0 5px ; width:1px; height:13px; display:inline-block;*/ margin-right:125px;    padding-right: 10px;}
        #YTN_main_2017 .links .familysite {border:1px solid #c7c7c7; display:inline-block; position: absolute;top:0;right:5px; width:115px}
        #YTN_main_2017 .ad_top {position:absolute; top:55px; right:0px;width:728px; height:90px; }

        /*네비게이션*/
        #YTN_main_2017 .main_navi {position:relative; margin:0 auto; width:990px; zoom: 1;margin-top: -52px; letter-spacing:-1px}
        #YTN_main_2017 .main_navi .menu01 {position:absolute; top:2px; left:5px}/*분야별 뉴스*/
        #YTN_main_2017 .main_navi .menu02 {position:absolute; top:2px; left:133px}/*와플뉴스*/
        #YTN_main_2017 .main_navi .menu03 {position:absolute; top:2px; left:242px}/*YTN Star*/
        #YTN_main_2017 .main_navi .menu04 {position:absolute; top:2px; left:353px}/*프로그램*/
        #YTN_main_2017 .main_navi .menu05 {position:absolute; top:2px; left:460px}/*레저*/
        #YTN_main_2017 .main_navi .menu06 {position:absolute; top:2px; left:537px}/*제보*/
        #YTN_main_2017 .main_navi .r_menu01 {position:absolute; top:2px; right:243px}/*라이브*/
        #YTN_main_2017 .main_navi .r_menu02 {position:absolute; top:2px; right:159px}/*편성표*/
        #YTN_main_2017 .main_navi .r_menu03 {position:absolute; top:2px; right:61px}/*다시보기*/
        #YTN_main_2017 .main_navi .r_menu04 {position:absolute; top:2px; right:0px}/*서치*/
        /*서치바*/
        #YTN_main_2017 .search {float:right;z-index:9999; position:absolute; right:30px; top:12px }
        #YTN_main_2017 .search .searchTerm {width:260px;height: 27px;padding-left: 10px;background: #fff;border: 0;font-size: 12px;line-height: 30px;color: #b5b5b5;}
        #YTN_main_2017 .search .searchBtn {width:36px;height:27px;margin-right: -1px;background: url('../img/main/icon_search_01.gif');background-repeat:no-repeat;
                                           border: 0;font-size: 0;line-height: 0;text-indent: -9999px;overflow: hidden;cursor: pointer; position: absolute;top:0px;right: -35px;}
        #YTN_main_2017 .search input {vertical-align: middle;}

        /*네비게이션 > 메인타이틀*/
        #YTN_main_2017 .main_navi .m_tit > a {font-size:15px; font-weight:bold; color:#fff; letter-spacing:-0.5px}
        #YTN_main_2017 .main_navi .m_tit_hover > a {font-size:15px; font-weight:bold; color:#67d2ff;}
        #YTN_main_2017 .main_navi .left_menu .m_menu > li{float:left; padding-top:14px;padding-left: 4px;zoom:1;}
        #YTN_main_2017 .main_navi .right_menu .m_menu > li{float:right; padding-top:14px;padding-left: 4px;zoom:1;}
        #YTN_main_2017 .main_navi .r_menu01 a {display:inline-block; padding-top:2px}/*라이브 아이콘 이미지*/
        #YTN_main_2017 .main_navi .r_menu04 a {display:inline-block; padding-top:2px}/*써치 아이콘 이미지*/
        /*네비게이션 > 서브타이틀*/
        #YTN_main_2017 .main_navi .m_menu li > ul {background:#dbdbdb;width:100%; }
        #YTN_main_2017 .main_navi .m_menu li ul{width: 870px;position: absolute;top:49px;z-index: 99998;height:35px; margin-left:-16px }
        #YTN_main_2017 .main_navi .m_menu li ul#sub_5{width: 400px;}/*레저 서브타이틀 너비 조절*/
        #YTN_main_2017 .main_navi .m_menu li ul li {float:left; z-index: 99999;display: inline-block; top: 5px;left: 10px;position:relative; margin-right:18px; }
        #YTN_main_2017 .main_navi .m_menu li ul li a {color:#222 !important; display:inline-block; font-size:14px;line-height:18px;background:#DBDBDB; font-weight:bold; }
        #YTN_main_2017 .main_navi .m_menu li ul li a:hover {padding-bottom:8px;  text-decoration:none;border-bottom:4px solid #1C9DE9; color:#0d5885 !important;background:#DBDBDB;}
        #YTN_main_2017 .main_navi .m_menu .sub_hover {padding-bottom:8px; border-bottom:4px solid #1C9DE9; text-decoration:none;border-bottom:4px solid #1C9DE9; color:#0d5885 !important;background:#DBDBDB;}

        /*메뉴 표시 아이콘*/
        #YTN_main_2017 .main_navi .m_menu .menu01_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #YTN_main_2017 .main_navi .m_menu .menu02_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #YTN_main_2017 .main_navi .m_menu .menu03_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #YTN_main_2017 .main_navi .m_menu .menu04_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #YTN_main_2017 .main_navi .m_menu .menu05_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #YTN_main_2017 .main_navi .m_menu .menu06_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #YTN_main_2017 .main_navi .m_menu .menu07_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #YTN_main_2017 .main_navi .m_menu .menu08_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        /**서브GNB 배경 바 (width 100% 회색바)**/
        #YTN_main_2017 .w_bar {position: relative; width:100%; height:35px;margin-top:0;z-index: 999;background: #dbdbdb; margin-bottom:5px;}

        /******************************복제*******************************/
        /*로고*/
        #clone  { display:block; z-index:999; position:fixed; width:100%; margin:0 auto; top: 0px;}
        #clone .bg_clone .area_flex { position:relative;margin:0 auto;width:990px; height:100%;}
        #clone .bg_clone .area_flex .logo_clone {position:relative; margin:0 auto; height:45px; background:#000;}
        #clone .bg_clone .area_flex .logo_clone h1 {position:absolute; top:8px;left:-2px;
                                                            background:url('../img/main/small_logo.png');background-repeat:no-repeat;width:120px;height:26px;}
        #clone .bg_clone .area_flex .logo_clone h1 a {display:inline-block; width: 120px;height: 32px;}
        /*네비게이션*/
        #clone .header_clone .navi_clone {position:relative; margin:0 auto; width:990px; zoom: 1;letter-spacing:-1px; margin-top:-50px; }
        #clone .header_clone .navi_clone a {font-size:14px !important;}
        #clone .header_clone .navi_clone a:hover {text-decoration:none;}


        #YTN_main_2017 .main_navi .menu01 {position:absolute; top:2px; left:5px}/*분야별 뉴스*/
        #YTN_main_2017 .main_navi .menu02 {position:absolute; top:2px; left:133px}/*와플뉴스*/
        #YTN_main_2017 .main_navi .menu03 {position:absolute; top:2px; left:242px}/*YTN Star*/
        #YTN_main_2017 .main_navi .menu04 {position:absolute; top:2px; left:353px}/*프로그램*/
        #YTN_main_2017 .main_navi .menu05 {position:absolute; top:2px; left:460px}/*레저*/
        #YTN_main_2017 .main_navi .menu06 {position:absolute; top:2px; left:537px}/*제보*/
        #YTN_main_2017 .main_navi .r_menu01 {position:absolute; top:2px; right:243px}/*라이브*/
        #YTN_main_2017 .main_navi .r_menu02 {position:absolute; top:2px; right:159px}/*편성표*/
        #YTN_main_2017 .main_navi .r_menu03 {position:absolute; top:2px; right:61px}/*다시보기*/
        #YTN_main_2017 .main_navi .r_menu04 {position:absolute; top:2px; right:0px}/*서치*/

        #clone .header_clone .navi_clone .menu01 {position:absolute; top:2px; left:164px}/*분야별 뉴스*/
        #clone .header_clone .navi_clone .menu02 {position:absolute; top:2px; left:282px}/*와플뉴스*/
        #clone .header_clone .navi_clone .menu03 {position:absolute; top:2px; left:381px}/*YTN Star*/
        #clone .header_clone .navi_clone .menu04 {position:absolute; top:2px; left:482px}/*프로그램*/
        #clone .header_clone .navi_clone .menu05 {position:absolute; top:2px; left:578px}/*레저*/
        #clone .header_clone .navi_clone .menu06 {position:absolute; top:2px; left:642px}/*제보*/
        #clone .header_clone .navi_clone .r_menu01 {position:absolute; top:2px; right:182px}/*라이브*/
        #clone .header_clone .navi_clone .r_menu02 {position:absolute; top:2px; right:118px}/*편성표*/
        #clone .header_clone .navi_clone .r_menu03 {position:absolute; top:2px; right:41px}/*다시보기*/
        #clone .header_clone .navi_clone .r_menu04 {position:absolute; top:2px; right:0px}/*서치*/
        /*서치바*/
        #clone .header_clone .navi_clone .search {float:right;z-index:9999; position:absolute; right:30px; top:12px }
        #clone .header_clone .navi_clone .search .searchTerm {width:230px;height: 27px;padding-left: 10px;background: #fff;border: 0;font-size: 12px;line-height: 30px;color: #b5b5b5;}
        #clone .header_clone .navi_clone .search .searchBtn {width:36px;height:27px;margin-right: -1px;background: url('../img/main/icon_search_01.gif');background-repeat:no-repeat;
                                           border: 0;font-size: 0;line-height: 0;text-indent: -9999px;overflow: hidden;cursor: pointer; position: absolute;top:0px;right: -35px;}
        #clone .header_clone .navi_clone .search input {vertical-align: middle;}

        /*네비게이션 > 메인타이틀*/
        #clone .header_clone .navi_clone .m_tit > a {font-size:15px; font-weight:bold; color:#fff; letter-spacing:-0.5px}
        #clone .header_clone .navi_clone .m_tit_hover > a {font-size:15px; font-weight:bold; color:#67d2ff;}
        #clone .header_clone .navi_clone .left_menu .m_menu > li{float:left; padding-top:14px;padding-left: 4px;zoom:1;}
        #clone .header_clone .navi_clone .right_menu .m_menu > li{float:right; padding-top:14px;padding-left: 4px;zoom:1;}
        #clone .header_clone .navi_clone .r_menu01 a {display:inline-block; padding-top:2px}/*라이브 아이콘 이미지*/
        #clone .header_clone .navi_clone .r_menu04 a {display:inline-block; padding-top:2px}/*써치 아이콘 이미지*/
        /*네비게이션 > 서브타이틀*/
        #clone .header_clone .navi_clone .m_menu li > ul {background:#dbdbdb;width:100%; }
        #clone .header_clone .navi_clone .m_menu li ul{width: 990px;position: absolute;top: 48px;z-index: 99998;height:37px; margin-left:-9px }
        #clone .header_clone .navi_clone .m_menu li ul li {float:left; z-index: 99999;display: inline-block; position: absolute;top: 5px;left: 10px;position:relative; margin-right:18px; }
        #clone .header_clone .navi_clone .m_menu li ul li a {color:#222 !important; display:inline-block; font-size:14px;display:inline-block;     background:#DBDBDB; font-weight:bold;  }
        #clone .header_clone .navi_clone .m_menu li ul li a:hover {padding-bottom:9px; border-bottom:4px solid #1C9DE9; text-decoration:none;border-bottom:4px solid #1C9DE9; color:#0d5885 !important;background:#DBDBDB;}

        /*메뉴 표시 아이콘*/
        #clone .header_clone .navi_clone .m_menu .menu01_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #clone .header_clone .navi_clone .m_menu .menu02_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #clone .header_clone .navi_clone .m_menu .menu03_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #clone .header_clone .navi_clone .m_menu .menu04_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #clone .header_clone .navi_clone .m_menu .menu05_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #clone .header_clone .navi_clone .m_menu .menu06_hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #clone .navi_clone .m_menu .menu07 > a:hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        #clone .header_clone .navi_clone .m_menu .menu08 > a:hover {background:url('../img/main/tip_ico.png') center bottom ;background-repeat:no-repeat;background-size:20px 10px; padding-bottom:16px;display:inline-block; }
        /**서브GNB 배경 바 (width 100% 회색바)**/
        #clone .w_bar {position: relative; width:100%; height:38px;margin-top:15px;z-index: 999;background: #dbdbdb; margin-bottom:5px}
        </style>
        </head>
        """
        
        var metaList:[String] = parser.parseHtml(data: str)
        XCTAssertEqual(metaList[0], "https://image.ytn.co.kr/general/jpg/2020/0318/202003181155552545_t.jpg")
        XCTAssertEqual(metaList[1], "[앵커]어제 하루 국내 코로나 19 환자가 93명 새로 확인돼,...")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.ㄴ
        }
    }

}
