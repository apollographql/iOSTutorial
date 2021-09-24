//
//  ProfileViewController.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 12/19/19.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {
    
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var emailLabel: UILabel!
    @IBOutlet private var idLabel: UILabel!
    @IBOutlet private var selectImageButton: UIButton!
    
    private func configureForImageURL(urlString: String?) {
        let personImage = UIImage(systemName: "person")
        guard
            let urlString = urlString,
            let url = URL(string: urlString) else {
                self.selectImageButton.setTitle("Select Image", for: .normal)
                self.profileImageView.image = personImage
                return
        }
        
        self.selectImageButton.setTitle("Update Image", for: .normal)
        self.profileImageView.sd_setImage(with: url, placeholderImage: personImage)
    }
    
    
    @IBAction private func closeTapped() {
        self.dismiss(animated: true)
    }
    
    @IBAction private func updateImageTapped() {
        // TODO: Update the image
    }
}


