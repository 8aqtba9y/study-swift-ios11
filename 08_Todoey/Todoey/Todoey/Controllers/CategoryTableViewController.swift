//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Qi Jsb on 2018/03/28.
//  Copyright © 2018年 Qi Jsb. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryTableViewController: SwipeTableViewController{
    
    let realm = try! Realm()

    // 1. setup category array
    var categories: Results<Category>!
    
    // 2. setup context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadCategories()
    }
    
    
    //MARK: - TableView Datasource Methods
    // 3. load data from context
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        if let colour = UIColor.init(hexString: categories?[indexPath.row].colour ?? "66CCFF") {
            cell.backgroundColor = colour
            cell.textLabel?.textColor = ContrastColorOf(colour, returnFlat: true)
        }
        
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
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    //MARK: - Add New Categories(:Button Event Methods)
    // 4. add items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFiled:UITextField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) {
            (action:UIAlertAction) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            
            let newCategory = Category()
            
            if(textFiled.text!.isEmpty) {
                newCategory.name = "New Category"
            }
            else {
                newCategory.name = textFiled.text!
            }
            
            newCategory.colour = UIColor.randomFlat.hexValue()
            
            self.save(category: newCategory)
            
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
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context, \(error)")
        }
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    
    //MARK: - Delete Data From Swipe
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category, \(error)")
            }
        }
    }
    
}

