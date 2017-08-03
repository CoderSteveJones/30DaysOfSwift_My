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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func childBtnClick(_ sender: UIButton) {
    }
    
    @IBAction func phoneBtnClick(_ sender: UIButton) {
    }
    
    @IBAction func shoppingBtnClick(_ sender: UIButton) {
    }
    
    @IBAction func traveBtnClick(_ sender: UIButton) {
    }
    
    @IBAction func doBtnClick(_ sender: UIButton) {
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
