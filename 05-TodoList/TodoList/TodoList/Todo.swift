//
//  Todo.swift
//  TodoList
//
//  Created by 江奔 on 2017/8/2.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

enum TodoType {
    
    case child
    case phone
    case shopping
    case traveling
}

class Todo: NSObject {
    var todoType: TodoType?
    var thing: String?
    var date: String?
}
