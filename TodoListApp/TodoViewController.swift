//
//  TodoViewController.swift
//  TodoListApp
//
//  Created by Aleksander Waage on 22/06/2020.
//  Copyright © 2020 Waageweb. All rights reserved.
//

import UIKit
import CoreData

class TodoViewController: UIViewController {
    
    var todo: TodoItem? = nil
    var toDoTableVC : TableViewController? = nil

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            if (todo.isImportant) {
                if let name = todo.name {
                    label.text = "❗️" + name
                }
            } else {
                label.text = todo.name
            }
        }
    }
    @IBAction func completeTodo(_ sender: Any) {
        if let todoToDelete = todo {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                       context.delete(todoToDelete)
                       (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                       toDoTableVC?.tableView.reloadData()
                       navigationController?.popViewController(animated: true)
                       return
                   }
        }
       
    }
}
