//
//  LaunchViewController.swift
//  News
//
//  Created by 김기현 on 2020/03/17.
//  Copyright © 2020 김기현. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    @IBOutlet private weak var outerView: UIView!
    @IBOutlet private weak var mainImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "navigationView")
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        outerView.layer.cornerRadius = outerView.bounds.width / 2
        outerView.layer.masksToBounds = true
    }
    
    deinit {
        print("LaunchViewController deinit")
    }
}
