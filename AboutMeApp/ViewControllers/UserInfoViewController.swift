//
//  UserInfoViewController.swift
//  AboutMeApp
//
//  Created by Egor Kruglov on 13.05.2023.
//

import UIKit

final class UserInfoViewController: UIViewController {
    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personNameLabel: UILabel!
    @IBOutlet var personSurnameLabel: UILabel!
    @IBOutlet var personCompanyLabel: UILabel!
    @IBOutlet var personOccupationLabel: UILabel!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradient()
        
        self.navigationController?.visibleViewController?.title = person.fullName

        personImage.image = UIImage(named: person.imageName)
        personNameLabel.text = person.name
        personSurnameLabel.text = person.surname
        personCompanyLabel.text = person.company
        personOccupationLabel.text = person.occupation
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userBioVC = segue.destination as? BioDetailsViewController else { return }
        userBioVC.person = person
    }

}
