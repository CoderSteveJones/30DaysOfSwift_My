//
//  Video.swift
//  PlayLocalVideo
//
//  Created by 江奔 on 2017/7/28.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

class Video: NSObject {

    var image: String?
    var title: String?
    var source: String?
    
    init(image: String, title: String, source: String) {
        super.init()
        self.image = image
        self.title = title
        self.source = source
    }
    
}
