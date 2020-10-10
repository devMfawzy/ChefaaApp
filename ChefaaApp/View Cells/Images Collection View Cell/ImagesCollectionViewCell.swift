//
//  LandingItemCell.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import UIKit
import Kingfisher

class ImagesCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.itemImageView.contentMode = .scaleAspectFill
        self.itemImageView.layer.cornerRadius = 5
        self.itemImageView.layer.masksToBounds = true
    }
    
    func configure(sectionItem: SectionItemPresentable) {
        itemImageView.kf.setImage(with: sectionItem.imagesUrl)
    }
    
}
