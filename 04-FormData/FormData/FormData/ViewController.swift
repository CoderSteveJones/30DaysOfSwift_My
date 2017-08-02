//
//  ViewController.swift
//  FormData
//
//  Created by 江奔 on 2017/8/2.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var genderSegC: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var workTf: UITextField!
    @IBOutlet weak var salarySlider: UISlider!
    @IBOutlet weak var mySwitch: UISwitch!
   
    @IBOutlet weak var salaryLabel1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func segValueChanged(_ sender: Any) {
        let seg = sender as! UISegmentedControl
        print(seg.selectedSegmentIndex)
    }
    
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        
        salaryLabel1.text = String(sender.value)
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        
        print(sender.isOn)
    }
}

