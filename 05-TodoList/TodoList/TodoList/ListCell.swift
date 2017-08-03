//
//  ListCell.swift
//  TodoList
//
//  Created by 江奔 on 2017/8/2.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var thingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var todo: Todo? {
        didSet {
            let type = todo?.todoType
            switch type! {
            case .child:
                imgView.image = UIImage(named: "child-selected")
                
            case .phone:
                imgView.image = UIImage(named: "phone-selected")
                
            case .shopping:
                imgView.image = UIImage(named: "shopping-cart-selected")
                
            case .traveling:
                imgView.image = UIImage(named: "travel-selected")
                
            }
            
            thingLabel.text = todo?.title
            dateLabel.text = todo?.date
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        imgView.layer.cornerRadius = 25
        imgView.layer.masksToBounds = true
    }

}
