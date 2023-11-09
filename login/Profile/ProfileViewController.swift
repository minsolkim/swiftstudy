//
//  ProfileViewController.swift
//  login
//
//  Created by 김민솔 on 2023/11/09.
//

import UIKit

class ProfileViewController: UIViewController {
    //Mark: --Properties
    
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    //Mark: --Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    //Mark: --Actions
    
    
    //Mark: --Helpers
    private func setupCollectionView() {
        //delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        // cell 등록
        profileCollectionView.register(UINib(
        nibName: "ProfileCollectionViewCell", bundle: nil
        ),forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    }

}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
                return UICollectionViewCell()
                //fatalError("셀 타입 캐스팅 실패")
            }
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: CGFloat(159))
    }
}
