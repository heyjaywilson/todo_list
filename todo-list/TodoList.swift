//
//  TodoList.swift
//  todo-list
//
//  Created by Maegan Wilson on 1/28/19.
//  Copyright © 2019 MW. All rights reserved.
//

import Foundation
import CoreData //importing core data here due to wanting to keep the same structure
import UIKit

// Deleting struct since I have it in coredata
class TodoList {
    private var todoList: [NSManagedObject] = [] //empty managed object that will allow me to work with the core data
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Todo")
        
        do {
            todoList = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func addTodo(task: String) {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "Todo", in: managedContext)!
            
            let todo = NSManagedObject(entity: entity, insertInto: managedContext)
            
            let logDate = Date.init()
            
            todo.setValue(task, forKeyPath: "task")
            todo.setValue(false, forKeyPath: "complete")
            todo.setValue(logDate, forKey: "logDate")
            
            do {
                try managedContext.save()
                todoList.append(todo)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
    }
    
    func count() -> Int {
        return todoList.count
    }
    
    func getTodo(index: Int) -> NSManagedObject {
        return todoList[index]
    }
    
    func deleteTodo(index: Int) {
        todoList.remove(at: index)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[index] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do {
                try managedContext.save()
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
    }

     func changeComplete(index: Int) {
        let complete = !((todoList[index].value(forKeyPath: "complete") as? Bool)!)
        todoList[index].setValue(complete, forKeyPath: "complete")
     }
}
