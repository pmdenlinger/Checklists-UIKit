//
//  AddItemViewControllerTableViewController.swift
//  Checklists-UIKit
//
//  Created by user on 6/13/21.
//

import UIKit

class AddItemViewControllerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
//    MARK: - Actions
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
}
