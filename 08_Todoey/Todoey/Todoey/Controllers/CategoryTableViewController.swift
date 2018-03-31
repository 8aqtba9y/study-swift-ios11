//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Qi Jsb on 2018/03/28.
//  Copyright © 2018年 Qi Jsb. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    // 1. setup category array
    var categoryArray:[Category] = []
    
    // 2. setup context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadItems()
    }
    
    //MARK: - TableView Datasource Methods
    // 3. load data from context
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let currentCategory = categoryArray[indexPath.row]
        cell.textLabel?.text = currentCategory.name
        
        return cell
    }
    
    
    //MARK: - TableView Delegate Methods
    // 3. load data from context
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
    
        if let indexPath = tableView.indexPathForSelectedRow {
            print(categoryArray[indexPath.row])
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    //MARK: - Button Event Methods
    // 4. add items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFiled:UITextField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) {
            (action:UIAlertAction) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            
            let newCategory = Category(context: self.context)
            newCategory.name = textFiled.text!
            self.categoryArray.append(newCategory)
            
            self.saveItems()
            
            self.tableView.reloadData()
        }
        
        alert.addTextField {
            (alertTextFiled:UITextField) in
            alertTextFiled.placeholder = "Create new category"
            textFiled = alertTextFiled
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    //MARK: - Data Manipulation Methods
    // 5. save & load categories
    func saveItems() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }
    }
    
    func loadItems(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        }
        catch {
            print("Error fetching data from context \(error)")
        }
        
        tableView.reloadData()
    }
    
}
