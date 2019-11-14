//
//  DetailViewController.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 11/13/19.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import UIKit
import Apollo

class DetailViewController: UIViewController {
    
    @IBOutlet private var missionPatchImageView: UIImageView!
    @IBOutlet private var missionNameLabel: UILabel!
    @IBOutlet private var rocketNameLabel: UILabel!
    @IBOutlet private var launchSiteLabel: UILabel!
    @IBOutlet private var bookCancelButton: UIBarButtonItem!
    
    private var launch: LaunchDetailsQuery.Data.Launch?
    
    var launchID: GraphQLID? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        guard
            let label = self.detailDescriptionLabel,
            let id = self.launchID else {
                return
        }
        
        label.text = "Launch \(id)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
}

