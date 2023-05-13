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
    
    private let validUserName = "user"
    private let validPassword = "password"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if userNameTF.text == validUserName && passwordTF.text == validPassword {
            performSegue(withIdentifier: "loginToWelocmeScreen", sender: sender)
        } else {
            generateAlertController(sender)
        }
    }
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        generateAlertController(sender)
    }
    
    private func generateAlertController(_ sender: UIButton) {
        var message: String {
            switch sender.tag {
            case 0:
                return "Your username - \(validUserName)"
            case 1:
                return "Your password - \(validPassword)"
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
    
}
