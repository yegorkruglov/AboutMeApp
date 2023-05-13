//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Egor Kruglov on 09.05.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    var personFullName: String!
    
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradient()
        welcomeLabel.text = "Welcome, \(personFullName ?? "🥷")"
    }
}
