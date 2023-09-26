//
//  LoginViewController.swift
//  login
//
//  Created by 김민솔 on 2023/09/22.
//

import UIKit

class LoginViewController: UIViewController {
    var email = String()
    var password = String()
    
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
        
    }
    
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTab(_ sender: UIButton) {
    }
    
    @IBAction func registerButtonDidTab(_ sender: UIButton) {
        //화면전환
        //스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //뷰컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        //화면전환 메소드를 이용해서 화면전환
//        self.present(registerViewController, animated: true,completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    private func setupAttribute() {
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1,font2,
            colors: color1,color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
    
}
