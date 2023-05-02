//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Ting-Syuan Wang on 2023/4/18.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    // Mark: Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    // Mark: Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    // Mark: Data Manipulation Methods
    
    func saveCategories(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
//        do {
//            categories = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
//
//        tableView.reloadData()
    }
    
    // Mark: Add New Categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { action in
            // what will happen once the user clickes the add Item Button
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            self.saveCategories(category: newCategory)
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Add a new category"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
}
