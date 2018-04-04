////
////  ViewController.swift
////  Todoey
////
////  Created by Qi Jsb on 2018/03/23.
////  Copyright © 2018年 Qi Jsb. All rights reserved.
////
//
//import UIKit
//
//class TodoListViewController_UserDefaults: UITableViewController { // , UITableViewDelegate, UITableViewDataSource
//
//    var itemArray:[Item] = []
//
////    let defaults:UserDefaults = UserDefaults.standard
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        print(dataFilePath)
//
////        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
////            itemArray = items
////        }
//        loadItems()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//
//    //MARK - Tableview Datasource Methods
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
//    //MARK - Tableview Delegate Methods
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        saveItems()
//
////        tableView.reloadData()
//        if itemArray[indexPath.row].done == true {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
//        else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//    }
//
//
//    //MARK - Add New Items
//    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
//        var textFiled:UITextField = UITextField()
//
//        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
//
//        let action = UIAlertAction(title: "Add Item", style: .default) {
//            (action:UIAlertAction) in
//            //what will happen once the user clicks the Add Item button on our UIAlert
//
//            let newItem = Item()
//            newItem.title = textFiled.text!
//
//            self.itemArray.append(newItem)
//
////            self.defaults.set(self.itemArray, forKey: "TodoListArray")
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
//    //MARK - Model Manupulation Methods
//    func saveItems() {
//        let encoder = PropertyListEncoder()
//        do {
//            let data = try encoder.encode(self.itemArray)
//            try data.write(to: self.dataFilePath!)
//        } catch {
//            print("Error encoding item array, \(error)")
//        }
//    }
//
//    func loadItems() {
//        if let data = try? Data(contentsOf: dataFilePath!) {
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([Item].self, from: data)
//            }
//            catch {
//                print("Error decoding item array, \(error)")
//            }
//        }
//    }
//
//}
//
//class Item:Encodable {
//    var title: String = ""
//    var done: Bool = false
//}
//
