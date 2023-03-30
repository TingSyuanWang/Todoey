//
//  ViewController.swift
//  Todoey
//
//  Created by Ting-Hsuan Wang on 3/28/23.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["todo1", "todo2", "todo3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
}
