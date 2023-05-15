//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Egor Kruglov on 09.05.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    var person: Person!
    
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setupGradient()
        welcomeLabel.text = "Welcome, \(person.fullName)"
    }
}
