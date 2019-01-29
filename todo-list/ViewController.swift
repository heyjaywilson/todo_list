//
//  ViewController.swift
//  todo-list
//
//  Created by Maegan Wilson on 1/28/19.
//  Copyright © 2019 MW. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var todoInput: UITextField!
    var todos = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todoInput.delegate = self
        todoInput.returnKeyType = .done
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
    
    // helper functions
    
    func addToList(resign:Bool) {
        todos.addTodo(todo: todoInput.text!)
        print("\(todos.returnList())")

        todoInput.text = ""
        
        if (resign == true){
            todoInput.resignFirstResponder()
        }
    }
}

