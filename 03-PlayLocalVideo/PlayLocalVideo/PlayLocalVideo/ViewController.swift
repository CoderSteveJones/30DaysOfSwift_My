//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by 江奔 on 2017/7/28.
//  Copyright © 2017年 TCGroup. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var data = [Video]()
    var player: AVPlayer?
    var playViewController: AVPlayerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.red
        tableView.rowHeight = 220
        let imgs = ["videoScreenshot01","videoScreenshot02","videoScreenshot03","videoScreenshot04","videoScreenshot05","videoScreenshot06","videoScreenshot07"]
        let titles = ["Introduce 3DS Mario","Emoji Among Us","Seals Documentary","Adventure Time","Facebook HQ","Lijiang Lugu Lake"]
        let sources = ["Youtube - 06:32","Vimeo - 3:34","Vine - 00:06","Youtube - 02:39","Facebook - 10:20","Allen - 20:30"]
        
        for i in 0..<6 {
            let video = Video(image: imgs[i], title: titles[i], source: sources[i])
            data.append(video)
            tableView.reloadData()
        }
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = data[indexPath.row]
        cell.playConsure = {
            self.play()
        }
        return cell
    }
    
    /** 播放 */
    func play() {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController = AVPlayerViewController()
        playViewController?.player = player
        player?.play()
        present(playViewController!, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

