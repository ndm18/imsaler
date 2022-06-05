//
//  LoginViewController.swift
//  imsaler
//
//  Created by Mykola on 20.05.2022.
//

import UIKit
import SwiftUI
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func loginButton(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            warningLabel.text = "Неверные данные"
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error != nil {
                self.warningLabel.text = "Ошибка"
                return
            }
            if user != nil {
                self.performSegue(withIdentifier: "SuccessSegue", sender: nil)
                return
            }
            self.warningLabel.text = "Пользователя не существует"
        }
    }
    
}
