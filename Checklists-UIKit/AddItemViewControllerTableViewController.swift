//
//  AddItemViewControllerTableViewController.swift
//  Checklists-UIKit
//
//  Created by user on 6/13/21.
//

import UIKit

class AddItemViewControllerTableViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
//    MARK: - Table View Delegates
    
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
//    MARK: - Actions
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        
        print("Contents of the text field: \(textField.text!)")
        navigationController?.popViewController(animated: true)
        
        
    }
}
