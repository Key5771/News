//
//  LaunchViewController.swift
//  News
//
//  Created by 김기현 on 2020/03/17.
//  Copyright © 2020 김기현. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    @IBOutlet private var outerView: UIView!
    @IBOutlet private var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "navigationView")
            UIApplication.shared.keyWindow?.rootViewController = vc
        }
    }
    
    override func viewDidLayoutSubviews() {
        outerView.layer.cornerRadius = outerView.bounds.width / 2
        outerView.layer.masksToBounds = true
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
