//
//  LaunchesViewController.swift
//  RocketReserver
//
//  Created by Ellen Shapiro on 11/13/19.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import UIKit

class LaunchesViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadLaunches()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    // MARK: - Segues
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showProfile" {
            // This should always occur
            return true
        }
        
        guard let selectedIndexPath = self.tableView.indexPathForSelectedRow else {
            return false
        }
        
        // TODO: Handle whether a segue should be performed depending on what row in what section was tapped
        self.tableView.deselectRow(at: selectedIndexPath, animated: true)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfile" {
            // No setup is required.
            return
        }
    
        // TODO: Handle setting which launch was selected
        guard
            let destination = segue.destination as? UINavigationController,
            let detail = destination.topViewController as? DetailViewController else {
                assertionFailure("Wrong kind of destination")
                return
            }
    
        self.detailViewController = detail
    }
    
    // MARK: - IBActions
    
    @IBAction private func launchTypeSelectorTapped(_ sender: UISegmentedControl) {
        // TODO: In the future, actually have this do something.
        sender.selectedSegmentIndex = 0
    }
    
    @IBAction private func profileTapped() {
        self.performSegue(withIdentifier: "showProfile", sender: nil)
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        // TODO: Configure
        cell.textLabel?.text = "Placeholder"
        
        return cell
    }
    
    private func loadLaunches() {
        // TODO: Load a list of launches
    }
}

