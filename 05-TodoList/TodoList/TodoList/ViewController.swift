//
//  ViewController.swift
//  TodoList
//
//  Created by 江奔 on 2017/8/2.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var todos = [Todo]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let titles = ["Go to Disney","Cicso Shopping","Phone to Jobs","Plan to Europe"]
        let dates = ["2014-10-20","2014-10-28","2014-10-30","2014-10-31"]
        let types = [TodoType.child,TodoType.shopping,TodoType.phone,TodoType.traveling]
        for i in 0..<4 {
            let todo = Todo(todoType: types[i], title: titles[i], date: dates[i])
            todos.append(todo)
        }
        
        tableView.tableFooterView = UIView()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func editClick(_ sender: UIBarButtonItem) {
        
        tableView.setEditing(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let iden = segue.identifier {
            
            if iden == "showDetail" {
                let vc = segue.destination as! TodoController
                let todo = sender as! Todo
                vc.todo = todo
                
            }else if iden == "addTodo" {
                
                let vc = segue.destination as! TodoController
                vc.doClosure = { (todo) in
                    self.todos.append(todo)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        cell.todo = todos[indexPath.row]
        return cell
    }

    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: todo)
    }
    
    // Eidt mode
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(editing, animated: true)
    }
    
    // Delete the cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // Move the cell
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }

}
