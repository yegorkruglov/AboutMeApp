//
//  Extension + UIView.swift
//  AboutMeApp
//
//  Created by Egor Kruglov on 13.05.2023.
//

import UIKit

extension UIView {
    func setupGradient() {
        let gradient = CAGradientLayer()
        
        gradient.frame = self.bounds
        gradient.colors = [UIColor.systemPink.cgColor, UIColor.systemCyan.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
