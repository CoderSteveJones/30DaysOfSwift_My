//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by 江奔 on 2017/7/28.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    
    /** 播放 */
    var playConsure: (()->())?
    
    
    var video: Video? {
        didSet {
            imgView.image = UIImage.init(named: (video?.image)!)
            videoTitleLabel.text = video?.title
            videoSourceLabel.text = video?.source
        }
    }
    
    @IBAction func playBtnClick(_ sender: Any) {
        
        if playConsure != nil {
            playConsure!()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
