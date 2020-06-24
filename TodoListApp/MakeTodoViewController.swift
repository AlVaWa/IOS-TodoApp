//
//  MakeTodoViewController.swift
//  TodoListApp
//
//  Created by Aleksander Waage on 22/06/2020.
//  Copyright © 2020 Waageweb. All rights reserved.
//

import UIKit

class MakeTodoViewController: UIViewController {

    @IBOutlet weak var todoName: UITextField!
    @IBOutlet weak var isImportant: UISwitch!
    
    var toDoTableVC : TableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTodo(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newTodo = TodoItem(context: context)
            if let name = todoName.text {
                newTodo.name = name
                newTodo.isImportant = isImportant.isOn
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)

                print("Adding todo: Name: \(name). Is important: \(isImportant.isOn)")
            }
        }
        
        todoName.text = ""
        isImportant.isOn = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
