//
//  ViewController.swift
//  StopWatch
//
//  Created by 江奔 on 2017/7/28.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var count = 0.0
    var isPlaying = false
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /** 开启 */
    @IBAction func playClick(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        isPlaying = true
    }
    
    func updateTime()  {
        count = count + 0.1
        countLabel.text = String(format: "%.1f", arguments: [count])
    }
    
    /** 停止 */
    @IBAction func pauseClick(_ sender: Any) {
        
        if isPlaying {
            
            timer?.invalidate()
            playBtn.isEnabled = true
            pauseBtn.isEnabled = false
            isPlaying = false
        }
    }
    
    /** 重置 */
    @IBAction func resetClick(_ sender: Any) {
        timer?.invalidate()
        count = 0.0
        countLabel.text = String(count)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
   

}

