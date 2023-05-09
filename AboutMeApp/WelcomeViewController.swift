//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Egor Kruglov on 09.05.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradient()
    }
    
    private func setupGradient() {
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemPink.cgColor, UIColor.systemCyan.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBAction func logOutButtonTapped() {
    }
    
}

