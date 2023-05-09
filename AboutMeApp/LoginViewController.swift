//
//  LoginViewController.swift
//  AboutMeApp
//
//  Created by Egor Kruglov on 09.05.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == "user", passwordTF.text == "password" else {
            // Введенное имя не валидно, отменяем переход и показываем алерт контроллер
            return false
        }
        
        // Введенное имя валидно, разрешаем переход
        return true
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if !shouldPerformSegue(withIdentifier: "loginToWelocmeScreen", sender: sender) {
            let alertController = UIAlertController(title: "Ooops!",
                                                    message: "Your username and/or password are incorrect",
                                                    preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .default) { _ in
                self.userNameTF.text = ""
                self.passwordTF.text = ""
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
        }
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        let alertController = UIAlertController(title: "Oops!",
                                                message: "Your username - user",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        let alertController = UIAlertController(title: "Oops!",
                                                message: "Your password - password",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
}

