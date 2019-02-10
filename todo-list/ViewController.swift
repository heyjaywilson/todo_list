//
//  ViewController.swift
//  todo-list
//
//  Created by Maegan Wilson on 1/28/19.
//  Copyright © 2019 MW. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var todoInput: UITextField!
    @IBOutlet weak var todoTable: UITableView!

    var todos = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todoInput.delegate = self
        todoInput.returnKeyType = .done
        
        //table view setup
        todoTable.dataSource = self
        todoTable.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        addToList(resign: true)
        return true
    }
    
    // table
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todos.getTodo(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Todo", for: indexPath)
        
        cell.textLabel?.text = todo.value(forKeyPath: "task") as? String
        let complete = todo.value(forKeyPath: "complete") as? Bool
        
        if(complete == true) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            }
            else {
                cell.accessoryType = .checkmark
            }
            todos.changeComplete(index: indexPath.row)
            todoTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.deleteTodo(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    // helper functions
    
    func addToList(resign:Bool) {
        todos.addTodo(task: todoInput.text!)
        todoInput.text = ""
        if (resign == true){
            todoInput.resignFirstResponder()
        }
        todoTable.reloadData()
    }
}

