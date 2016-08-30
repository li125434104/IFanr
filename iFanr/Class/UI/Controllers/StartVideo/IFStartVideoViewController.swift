//
//  StartVideoViewController.swift
//  iFanr
//
//  Created by LXJ on 16/8/29.
//  Copyright © 2016年 LianLuo. All rights reserved.
//

import UIKit
import AVFoundation

class IFStartVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.playFinished), name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        
        let playerLayer = AVPlayerLayer(player: self.player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        
        self.player.play()
    }

    func playFinished() {
        print("视频结束了")
        self.dismissViewControllerAnimated(false, completion: nil)
        self.view.window?.rootViewController = IFMainViewController()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    private lazy var player: AVPlayer = {
        let player = AVPlayer(playerItem: self.playerItem)
        print("第一次创建player")
        return player
    }()
    
    private lazy var playerItem : AVPlayerItem = {
        let videoPath = NSBundle.mainBundle().pathForResource("ifanrVideo", ofType: "mp4")
        let playerItem = AVPlayerItem(URL: NSURL.fileURLWithPath(videoPath!))
        print("第一次创建AVPlayerItem")
        return playerItem
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
