//
//  CustomUserCell.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import UIKit

class CustomUserCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var gender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        personImage.image = UIImage(named: "person.fill")
        title.text = "..."
        name.text = "..."
        gender.text = "..."
    }
    
    func setupCell(user: User) {
        title.text = user.name?.title ?? "..."
        gender.text = user.gender?.capitalized ?? "..."
        name.text = "\(user.name?.first ?? "...") \(user.name?.last ?? "")"
        if let urlImage = user.picture?.medium {
            personImage.imageFromServerURL(urlString: urlImage, placeHolderImage: UIImage(named: "person.fill"))
        } else {
            personImage.image = UIImage(named: "person.fill")
        }
        personImage.roundImage()
    }
    
}
