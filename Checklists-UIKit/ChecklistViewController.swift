//
//  ChecklistViewController.swift
//  Checklists-UIKit
//
//  Created by user on 6/12/21.
//

import UIKit

class ChecklistViewController: UITableViewController,
                               AddItemViewControllerDelegate {
    
    var items = [ChecklistItem]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        item5.checked = true
        items.append(item5)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
        
    }
    
    //    MARK: - Navigation
    
    override func prepare(
        for segue: UIStoryboardSegue, sender: Any? ) {
//        1
        if segue.identifier == "AddItem" {
//        2
        let controller = segue.destination as! AddItemViewController
//        3
        controller.delegate = self
        }
    }

// MARK: - Table View Data Source
    
    override func tableView (
        _ tableView: UITableView,
        numberOfRowsInSection section:Int
    ) -> Int {
        return items.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem",
                                                 for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
//    MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            
            let item = items[indexPath.row]
            item.checked.toggle()
            
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //    MARK: - Add Item ViewController Delegates
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
        
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    
}
