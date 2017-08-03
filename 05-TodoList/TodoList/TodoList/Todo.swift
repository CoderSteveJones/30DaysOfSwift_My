//
//  Todo.swift
//  TodoList
//
//  Created by 江奔 on 2017/8/2.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

enum TodoType: Int {
    
    case child = 0
    case phone = 1
    case shopping = 2
    case traveling = 3
}

class Todo: NSObject {
    var todoType: TodoType
    var title: String
    var date: String
    
    init(todoType: TodoType,title: String, date: String) {
        self.todoType = todoType
        self.title = title
        self.date = date
    }
}
