//
//  UIViewController+Extension.swift
//  login
//
//  Created by 김민솔 on 2023/09/25.
//

import UIKit

extension UIViewController {
    func generateButtonAttribute(_ button: UIButton,
                                 texts: String...,
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString {
        guard let wholeText = button.titleLabel?.text else { fatalError("버튼에 텍스트가 없음.")}
        
        let customFonts: [UIFont] = fonts
        
        //설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map{index in
            (wholeText as NSString).range(of: texts[index])
        }
        let customColors = colors
        
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        texts.indices.forEach { index in
            attributedString.addAttributes(.font, value: customFonts[index], range: customTextsRanges[index])
            attributedString.addAttributes(.forgrondColor, value: customColors[index],range: customTextsRanges[index])
            
        }
        return attributedString
    }
}
