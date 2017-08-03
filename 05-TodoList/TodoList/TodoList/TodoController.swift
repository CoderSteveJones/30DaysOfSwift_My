//
//  TodoController.swift
//  TodoList
//
//  Created by 江奔 on 2017/8/2.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

class TodoController: UIViewController {

    
    var todo: Todo?
    
    @IBOutlet weak var childBtn: UIButton!
    
    @IBOutlet weak var phoneBtn: UIButton!
    
    @IBOutlet weak var shoppingBtn: UIButton!
    
    @IBOutlet weak var travelBtn: UIButton!
    
    @IBOutlet weak var titleTf: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var doClosure: ((_ todo: Todo) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let todo = self.todo {
            
            switch todo.todoType {
            case .child:
                childBtn.isSelected = true
            case .phone:
                phoneBtn.isSelected = true
            case .shopping:
                shoppingBtn.isSelected = true
            case .traveling:
                travelBtn.isSelected = true
            }
            
            titleTf.text = todo.title
            
            let dateFmt = DateFormatter()
            dateFmt.dateFormat = "yyyy-MM-dd"
            let date = dateFmt.date(from: todo.date)
            datePicker.date = date!
        }else {
            childBtn.isSelected = true
        }
        
        
        
    }

    
    @IBAction func childBtnClick(_ sender: UIButton) {
        sender.isSelected = true
        phoneBtn.isSelected = false
        shoppingBtn.isSelected = false
        travelBtn.isSelected = false
    }
    
    @IBAction func phoneBtnClick(_ sender: UIButton) {
        sender.isSelected = true
        childBtn.isSelected = false
        shoppingBtn.isSelected = false
        travelBtn.isSelected = false
    }
    
    @IBAction func shoppingBtnClick(_ sender: UIButton) {
        sender.isSelected = true
        phoneBtn.isSelected = false
        childBtn.isSelected = false
        travelBtn.isSelected = false
    }
    
    @IBAction func traveBtnClick(_ sender: UIButton) {
        sender.isSelected = true
        phoneBtn.isSelected = false
        shoppingBtn.isSelected = false
        childBtn.isSelected = false
    }
    
    @IBAction func doBtnClick(_ sender: UIButton) {
        
        var type: TodoType = .child
        if phoneBtn.isSelected {
            type = .phone
        }else if shoppingBtn.isSelected {
            type = .shopping
        }else if travelBtn.isSelected {
            type = .traveling
        }
        
        var title = ""
        if let getTitle = titleTf.text {
            title = getTitle
        }
        
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "yyyy-MM-dd"
        let dateStr = dateFmt.string(from: datePicker.date)
        
        if let todo = self.todo {// 更新已有todo
            
            todo.date = dateStr
            todo.title = title
            todo.todoType = type
            
        }else { // 添加新todo
            
            let todo = Todo(todoType: type, title: title, date: dateStr)
            
            if self.doClosure != nil {
                doClosure(todo)
            }
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
