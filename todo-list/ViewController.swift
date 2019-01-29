//
//  ViewController.swift
//  todo-list
//
//  Created by Maegan Wilson on 1/28/19.
//  Copyright © 2019 MW. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Todo")! //1.
        
        let text = todos.getTodo(index: indexPath.row).task //2.
        
        cell.textLabel?.text = text //3.
        
        return cell //4.
    }
    
    // helper functions
    
    func addToList(resign:Bool) {
        todos.addTodo(todo: todoInput.text!)
        print("\(todos.returnList())")

        todoInput.text = ""
        
        if (resign == true){
            todoInput.resignFirstResponder()
        }
        todoTable.reloadData()
    }
}

