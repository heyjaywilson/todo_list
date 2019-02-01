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
        addToList(resign: false)
        return true
    }
    
    @IBAction func addTodo(_ sender: Any) {
        addToList(resign: true)
        
    }
    // table
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Todo") as! UITableViewCell
        
        let text = todos.getTodo(index: indexPath.row).task
        
        cell.textLabel?.text = text
        
        if(todos.getTodo(index: indexPath.row).complete) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("selected row")
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            }
            else {
                cell.accessoryType = .checkmark
            }
            todos.changeComplete(index: indexPath.row)
            todos.sortByCompleted()
            todoTable.reloadData()
        }
    }
    // helper functions
    
    func addToList(resign:Bool) {
        todos.addTodo(todo: todoInput.text!)
        todoInput.text = ""
        if (resign == true){
            todoInput.resignFirstResponder()
        }
        todos.sortByCompleted()
        todoTable.reloadData()
    }
}

