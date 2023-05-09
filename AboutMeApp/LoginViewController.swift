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
    
    private func generateAlertController(_ sender: UIButton) {
        var message: String {
            switch sender.tag {
            case 0:
                return "Your username - user"
            case 1:
                return "Your password - password"
            default:
                return "Your username and/or password are incorrect"
            }
        }
        
        let alertController = UIAlertController(title: "Oops!",
                                                message: message,
                                                preferredStyle: .alert)
        
        var action: UIAlertAction {
            switch sender.tag {
            case 0, 1:
                return UIAlertAction(title: "OK", style: .default)
            default:
                return UIAlertAction(title: "OK", style: .default) { _ in
                    self.passwordTF.text = "" }
            }
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if !shouldPerformSegue(withIdentifier: "loginToWelocmeScreen", sender: sender) {
            generateAlertController(sender)
        }
    }
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        generateAlertController(sender)
    }
    
    
    
}

