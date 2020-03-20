//
//  ContentViewController.swift
//  News
//
//  Created by 김기현 on 2020/03/20.
//  Copyright © 2020 김기현. All rights reserved.
//

import UIKit
import WebKit

class ContentViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var newsItems: RSSData?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        
        view = webView
        
        self.title = newsItems?.title
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: newsItems?.link ?? "")
        let request = URLRequest(url: url!)
        webView.load(request)
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
