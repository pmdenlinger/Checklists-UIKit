//
//  ChecklistViewController.swift
//  Checklists-UIKit
//
//  Created by user on 6/12/21.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

// MARK: - Table View Data Source
    
    override func tableView (
        _ tableView: UITableView,
        numberOfRowsInSection section:Int
    ) -> Int {
        return 5
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem",
                                                 for: indexPath)
        return cell
    }
}

