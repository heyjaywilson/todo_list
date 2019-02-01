//
//  TodoList.swift
//  todo-list
//
//  Created by Maegan Wilson on 1/28/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation

struct Todo {
    var task: String
    var complete:Bool = false
}

class TodoList {
    private var todoList = [Todo]()
    
    func addTodo(todo: String) {
        let newTodo = Todo(task: todo, complete: false)
        todoList.append(newTodo)
    }
    
    func returnList() -> Array<Todo> {
        return todoList
    }
    
    func count() -> Int {
        return todoList.count
    }
    
    func getTodo(index: Int) -> Todo {
        return todoList[index]
    }
    
    func changeComplete(index: Int) {
        todoList[index].complete = !todoList[index].complete
    }
    
    func sortByCompleted(){
        for (i, todo) in todoList.enumerated(){
            if (todo.complete) {
                let element = todoList.remove(at: i)
                todoList.insert(element, at: todoList.count)
            }
        }
    }
}
