//
//  RegisterViewController.swift
//  login
//
//  Created by 김민솔 on 2023/09/22.
//

import UIKit

class RegisterViewController: UIViewController {
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    //유효성검사를 위한 프로퍼터
    var isValidEmail = false {
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
            print("isValidEmail did set: \(isValidEmail)")
        }
    }
    
    var isValidName = false {
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
            print("isValidName did set: \(isValidName)")
        }
    }
    
    var isValidNickname = false {
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
            print("isValidNickname did set: \(isValidNickname)")
        }
    }
    
    var isValidPassword = false {
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
            print("isValidPassword did set: \(isValidPassword)")
        }
    }

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var popToLoginButton: UIButton!
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField,passwordTextField]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        //bug fix
        self.navigationController?
            .interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        default:
            fatalError("Missing TextField")
        }
    }
    //뒤로가기
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            password: self.password)
        
        self.userInfo?(userInfo)
    }
    // MARK: - Helpers
    private func setupTextField() {
        textFields.forEach {
            tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    private func validateUserInfo() {
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            self.signupButton.backgroundColor =
            UIColor.facebookColor
        }else {
            self.signupButton.backgroundColor = UIColor.disabledButtonColor
                
        }
    }
    private func setupAttribute() {
        let text1 = "계정이 있으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1, text2,
            fonts: font1,font2,
            colors: color1,color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }

   
}
extension String {
    func isValidPassword() -> Bool {
        let regularExpression =
        "^(?=.*[a-z])(?=.*[0-9]).{6,}$"
        //"^(?=.*[a-z])(?=.*[A-Z])(?=.*[\\d])(?=.*[$@$!%*?$])[A-Za-z\\d$@$!%*?$]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: self)
    }
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@",emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
