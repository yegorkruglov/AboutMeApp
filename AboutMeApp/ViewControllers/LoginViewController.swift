//
//  LoginViewController.swift
//  AboutMeApp
//
//  Created by Egor Kruglov on 09.05.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var username: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let user = User.getUser()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.person = user.person
            } else if let navigationVC = viewController as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.person = user.person
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        username.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if username.text == user.username && passwordTF.text == user.password {
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
                return "Your username - \(user.username)"
            case 1:
                return "Your password - \(user.password)"
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

