////
////  ViewController.swift
////  Todoey
////
////  Created by Qi Jsb on 2018/03/23.
////  Copyright © 2018年 Qi Jsb. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class TodoListViewController: UITableViewController {
//
//    var itemArray:[Item] = []
//
//    var selectedCategory: Category? {
//        didSet {
//            loadItems()
//        }
//    }
//
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//
//    //MARK: - Tableview Datasource Methods
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
//
//        let currentItem = itemArray[indexPath.row]
//        cell.textLabel?.text = currentItem.title
//        cell.accessoryType = currentItem.done ? .checkmark : .none
//
//        return cell
//    }
//
//
//    //MARK: - Tableview Delegate Methods
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        //destroy;
////        context.delete(itemArray[indexPath.row])
////        itemArray.remove(at: indexPath.row)
//
//        //update;
////        itemArray[indexPath.row].setValue("Completed", forKey: "title")
//        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        saveItems()
//
//        tableView.reloadData()
//    }
//
//
//    //MARK: - Add New Items
//    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
//        var textFiled:UITextField = UITextField()
//
//        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
//
//        let action = UIAlertAction(title: "Add Item", style: .default) {
//            (action:UIAlertAction) in
//            //what will happen once the user clicks the Add Item button on our UIAlert
//
//            let newItem = Item(context: self.context)
//            newItem.title = textFiled.text!
//            newItem.done = false
//            newItem.parentCategory = self.selectedCategory
//            self.itemArray.append(newItem)
//
//            self.saveItems()
//
//            self.tableView.reloadData()
//        }
//
//        alert.addTextField {
//            (alertTextFiled:UITextField) in
//            alertTextFiled.placeholder = "Create new item"
//            textFiled = alertTextFiled
//        }
//
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//    }
//
//
//    //MARK: - Model Manupulation Methods
//    func saveItems() {
//
//        do {
//            try context.save()
//        } catch {
//            print("Error saving context, \(error)")
//        }
//    }
//
//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
//
////        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, predicate])
////        request.predicate = predicate
//        if let additionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
//        }
//        else {
//            request.predicate = categoryPredicate
//        }
//
//
//        do {
//            itemArray = try context.fetch(request)
//        }
//        catch {
//            print("Error fetching data from context \(error)")
//        }
//
//        tableView.reloadData()
//    }
//
//}
//
////MARK: - Search bar methods
//extension TodoListViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let request : NSFetchRequest<Item> = Item.fetchRequest()
//
//        //CONTAINS[cd]: contains word it's case and diacritic
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//        loadItems(with: request, predicate: predicate)
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            loadItems()
//
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
//
//}
//
//
