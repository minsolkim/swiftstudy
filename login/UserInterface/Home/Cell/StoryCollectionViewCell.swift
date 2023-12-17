//
//  StoryCollectionViewCell.swift
//  login
//
//  Created by 김민솔 on 2023/11/08.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewImageViewBackground: UIView!
    @IBOutlet weak var userprofile: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    @IBOutlet weak var labelUser: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewImageViewBackground.layer.cornerRadius = 24
        userprofile.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
    }

}
