//
//  RegisterViewController.swift
//  imsaler
//
//  Created by Mykola on 20.05.2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    @IBAction func registerButton(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else { return }
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil{
                if user != nil{
                    self.performSegue(withIdentifier: "SuccesSegue", sender: nil)
                }
            }
        }
    }
    
}
