//
//  TableViewController.swift
//  TodoListApp
//
//  Created by Aleksander Waage on 22/06/2020.
//  Copyright © 2020 Waageweb. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var toDos: [TodoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo`s"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataTodoItems = try? context.fetch(TodoItem.fetchRequest()) as? [TodoItem]{
                toDos = coreDataTodoItems
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if (toDos[indexPath.row].isImportant){
            if let name = toDos[indexPath.row].name {
                cell.textLabel?.text = "❗️" + name
            }
        }else {
            cell.textLabel?.text = toDos[indexPath.row].name
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToTodo", sender: selectedTodo)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let makeTodoVC = segue.destination as? MakeTodoViewController {
            makeTodoVC.toDoTableVC = self
        }
        
        if let todoVC = segue.destination as? TodoViewController {
            let selectedTodo = sender as! TodoItem
            todoVC.todo = selectedTodo
            todoVC.toDoTableVC = self
        }
        
    }
    
}
