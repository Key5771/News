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
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var firstView: UIView!
    @IBOutlet private weak var secondView: UIView!
    @IBOutlet private weak var thirdView: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    private var webView: WKWebView?
    private var observation: NSKeyValueObservation?
    var newsItems: RSSData?
    
    // ARC Action Check.
    deinit {
        print("ContentViewController deinit")
        observation = nil
    }

    // MARK: - ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beforeViewDidLoad()
        setLabel()
        
        view.addSubview(stackView)
        
        guard let link = newsItems?.link, let url = URL(string: link) else { return }
        let request = URLRequest(url: url)
        webView?.load(request)
    }
    
    // MARK: - initView
    func beforeViewDidLoad() {
        let webView = WKWebView(frame: self.outerView.bounds, configuration: WKWebViewConfiguration())
        self.webView = webView
        
        observation = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] (webView, change) in
            DispatchQueue.main.async {
                if let value = change.newValue {
                    self?.progressBar.progress = Float(value)
                    
                    if value == 1 {
                        self?.progressBar.isHidden = true
                    }
                }
            }
        }
        
        self.outerView.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: outerView.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: outerView.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: outerView.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: outerView.trailingAnchor).isActive = true
        
        webView.uiDelegate = self
        
        self.title = newsItems?.title
    }
    
    func setLabel() {
        if newsItems?.keyword != nil {
            firstView.layer.borderWidth = 0.5
            secondView.layer.borderWidth = 0.5
            thirdView.layer.borderWidth = 0.5
            
            firstLabel.text = newsItems?.keyword?[0]
            secondLabel.text = newsItems?.keyword?[1]
            thirdLabel.text = newsItems?.keyword?[2]
        } else {
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
        }
    }

}
