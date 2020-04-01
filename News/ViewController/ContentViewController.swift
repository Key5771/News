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
    
    @IBOutlet private weak var outerView: UIView!
    @IBOutlet private weak var firstLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!
    @IBOutlet private weak var thirdLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    private var webView: WKWebView!
    var newsItems: RSSData?
    
    func beforeViewDidLoad() {
        super.loadView()
        
        webView = WKWebView(frame: self.outerView.bounds, configuration: WKWebViewConfiguration())
        
        self.outerView.addSubview(webView)
        webView.uiDelegate = self
        
        self.title = newsItems?.title
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        beforeViewDidLoad()
        
        if newsItems?.keyword != nil {
            firstView.layer.borderWidth = 1
            secondView.layer.borderWidth = 1
            thirdView.layer.borderWidth = 1
            
            firstLabel.text = newsItems?.keyword?[0]
            secondLabel.text = newsItems?.keyword?[1]
            thirdLabel.text = newsItems?.keyword?[2]
        } else {
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
        }
        
        view.addSubview(stackView)
        
        let url = URL(string: newsItems?.link ?? "")
        let request = URLRequest(url: url!)
        webView.load(request)
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
