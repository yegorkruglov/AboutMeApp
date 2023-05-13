//
//  BioDetailsViewController.swift
//  AboutMeApp
//
//  Created by Egor Kruglov on 13.05.2023.
//

import UIKit

final class BioDetailsViewController: UIViewController {

    @IBOutlet var bioLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradient()
        
        self.navigationController?.visibleViewController?.title = "\(person.fullName) Bio"
        
        bioLabel.text = person.bio
    }
    
}
