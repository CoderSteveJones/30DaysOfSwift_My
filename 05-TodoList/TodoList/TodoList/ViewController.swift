//
//  ViewController.swift
//  TodoList
//
//  Created by 江奔 on 2017/8/2.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var todos = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0..<10 {
            
        }
    }

    // MARK: UITableViewDelegate - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: todo)
    }
    
    @IBAction func editClick(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func addClick(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "addTodo", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let iden = segue.identifier {
            
            switch iden {
            case "showDetail":
                let vc = segue.destination as! TodoController
                let todo = sender as! Todo
                vc.todo = todo
                navigationController?.pushViewController(vc, animated: true)
            case "addTodo":
                let vc = segue.destination as! TodoController
                navigationController?.pushViewController(vc, animated: true)
            default: break
                
            }

        }
    }
    
}

