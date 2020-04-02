//
//  ListTableViewCell.swift
//  News
//
//  Created by 김기현 on 2020/03/17.
//  Copyright © 2020 김기현. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var thumbNailImage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    var link: String?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        link = nil
        titleLabel.text = nil
        contentLabel.text = nil
        thumbNailImage.image = UIImage(named: "noImage")
        firstLabel.text = nil
        secondLabel.text = nil
        thirdLabel.text = nil
        
    }
}
