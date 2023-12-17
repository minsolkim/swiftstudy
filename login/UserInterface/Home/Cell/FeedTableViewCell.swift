//
//  FeedTableViewCell.swift
//  login
//
//  Created by 김민솔 on 2023/10/29.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewMyProfile: UIImageView!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var labelHowManyLike: UILabel!
    @IBOutlet weak var buttonIsBookMark: UIButton!
    @IBOutlet weak var buttonIsHeart: UIButton!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    @IBAction func actionBookMark(_ sender: Any) {
        if buttonIsBookMark.isSelected {
            buttonIsBookMark.isSelected = false
        } else {
            buttonIsBookMark.isSelected = true
        }
    }
    @IBAction func actionIsHeart(_ sender: Any) {
        if buttonIsHeart.isSelected {
            buttonIsHeart.isSelected = false
        } else {
            buttonIsHeart.isSelected = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewUserProfile.layer.cornerRadius = 12.5
        imageViewUserProfile.clipsToBounds = true
        imageViewMyProfile.layer.cornerRadius = 12.5
        imageViewMyProfile.clipsToBounds = true
        
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 3))
        labelFeed.attributedText = attributedStr
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
