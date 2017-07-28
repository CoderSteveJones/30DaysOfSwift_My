//
//  ViewController.swift
//  ChangeFont
//
//  Created by 江奔 on 2017/7/28.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var changeBtn: UIButton!
    var fontNameIndex = 0
    
    lazy var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                     "测试测试测试测试测试测试",
                     "123",
                     "Alex",
                     "@@@@@@"]
    lazy var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        changeBtn.layer.cornerRadius = 50.0
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        tableView.rowHeight = 35

    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.font = UIFont(name: fontNames[fontNameIndex], size: 15.0)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    @IBAction func changeBtnClick(_ sender: Any) {
        
        fontNameIndex = (fontNameIndex + 1) % 5
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

