//
//  RegisterViewController.swift
//  login
//
//  Created by 김민솔 on 2023/09/22.
//

import UIKit

class RegisterViewController: UIViewController {
    var isValidEmail = false {
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet { //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField,passwordTextField]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
        case nameTextField:
            self.isValidName = text.count > 2
        case nicknameTextField:
            self.isValidNickname = text.count > 2
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
        default:
            fatalError("Missing TextField")
        }
    }
    // MARK: - Helpers
    private func setupTextField() {
        textFields.forEach {
            tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    private func validateUserInfo() {
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword {
            self.signupButton.backgroundColor =
            UIColor.facebookColor
        }else {
            self.signupButton.backgroundColor = .disabledButtonColor
                
        }
    }

   
}
extension String {
    func isValidPassword() -> Bool {
        let regularExpression = //"^(?=.*[a-z])(?=.*[A-Z])(?=.*[\\d])(?=.*[$@$!%*?$])[A-Za-z\\d$@$!%*?$]{8,}"
        "(?=.*[A-Z])(?=.*[a-z])(?=.*[\\d])"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: self)
    }
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@",emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
