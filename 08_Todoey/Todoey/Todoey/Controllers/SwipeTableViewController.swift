//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Qi Jsb on 2018/04/09.
//  Copyright © 2018年 Qi Jsb. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    var cell: UITableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
    }
    
    // TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        
        return cell
    }

    // Adopt the SwipeTableViewCellDelegate protocol:
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { (action:SwipeAction, indexPath:IndexPath) in
            
            print("Delete Cell")
            self.updateModel(at: indexPath)
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    // Optionally, you can implement the editActionsOptionsForRowAt method to customize the behavior of the swipe actions:
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        var options = SwipeTableOptions()
        options.expansionStyle = .destructive
        //options.transitionStyle = .border
        return options
    }
    
    func updateModel(at indexPath:IndexPath) {
        
    }
}

