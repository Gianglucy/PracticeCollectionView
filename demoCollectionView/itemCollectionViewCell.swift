//
//  itemCollectionViewCell.swift
//  demoCollectionView
//
//  Created by Apple on 7/10/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import UIKit

class itemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myIMG: UIImageView!
    var myLable = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myIMG.image = UIImage(named: "img_image")
        myIMG.contentMode = .scaleToFill
        
        
    }
}
