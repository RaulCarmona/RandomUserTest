//
//  DetailView.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import UIKit

class DetailView: UIViewController {
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var contryTitle: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var contry: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail View"
        setupView()
    }
    
    func setupView() {
        guard let user = user else { return }
        fullNameLabel.text = "\(user.name?.title ?? "") \(user.name?.last ?? "")"
        contryTitle.text = user.location?.country
        firstName.text = user.name?.first
        password.text = user.login?.password
        userName.text = user.login?.username
        street.text = user.location?.street?.name
        state.text = user.location?.state
        city.text = user.location?.city
        lastName.text = user.name?.last
        contry.text = user.location?.country
        gender.text = user.gender?.capitalized
        if let profileImage = user.picture?.large {
            profileImageView.imageFromServerURL(urlString: profileImage, placeHolderImage: UIImage(named: "person.fill"))
        } else {
            profileImageView.image = UIImage(named: "person.fill")
        }
        profileImageView.roundImage()
    }
}
