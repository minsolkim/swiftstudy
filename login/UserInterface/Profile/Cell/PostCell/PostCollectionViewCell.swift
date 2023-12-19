//
//  PostCollectionViewCell.swift
//  login
//
//  Created by 김민솔 on 2023/11/10.
//

import UIKit
import Kingfisher
class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func setupData() {
        //이미지뷰의 이미지를 업로드 한다. 
    }
    public func setupData(_ imageURLStr: String?) {
        //이미지뷰의 이미지를 업로드한다.
        guard let imageURLStr = imageURLStr else { return }
        if let url = URL(string: imageURLStr) {
            postImageView.kf.setImage(
                with: url, placeholder: UIImage(systemName: "photo"))

        }
    }

}
